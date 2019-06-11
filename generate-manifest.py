#!/usr/bin/env python3

import argparse
import gi
import hashlib
import json
import os
import re
import sys
from urllib import request

gi.require_version('Flatpak', '1.0')
from gi.repository import Flatpak

# Architecture conversion between debian and flatpak
DEBIAN_TO_FLATPAK_ARCH_OVERRIDES = {
    'armhf': 'arm',
    'amd64': 'x86_64',
}

FLATPAK_TO_DEBIAN_ARCH_OVERRIDES = \
    dict([(v, k) for k, v in DEBIAN_TO_FLATPAK_ARCH_OVERRIDES.items()])

FREEDESKTOP_MANIFEST_URL = \
    'https://raw.githubusercontent.com/flatpak/freedesktop-sdk-images/1.6/org.freedesktop.Sdk.json.in'

GNOME_MANIFEST_URL = \
    'https://gitlab.gnome.org/GNOME/gnome-sdk-images/raw/gnome-{version}/org.gnome.Sdk.json.in'

def canonicalize_arch(arch, debian=False):
    """Transform arch names to the canonical names used by flatpak

    If debian is True, they are instead converted to canonical debian names.
    """
    if debian:
        return FLATPAK_TO_DEBIAN_ARCH_OVERRIDES.get(arch, arch)
    else:
        return DEBIAN_TO_FLATPAK_ARCH_OVERRIDES.get(arch, arch)

def default_arch(debian=False):
    """Get default flatpak architecture for host

    If debian is True, it will be converted to debian format.
    """
    arch = Flatpak.get_default_arch()
    if debian:
        arch = canonicalize_arch(arch, debian=True)
    return arch

def edit_manifest(data, arch, branch, runtime_version):
    """Edit manifest json data for architecture arch"""
    arch = canonicalize_arch(arch)
    supported_arches = Flatpak.get_supported_arches()
    if arch not in supported_arches:
        # Add a bind mount option for the qemu user static emulator for this
        # architecture. The qemu arch names seem to match flatpak
        build_opts = data.setdefault('build-options', {})
        build_args = build_opts.setdefault('build-args', [])
        opt = '--bind-mount=/run/qemu-{0}-static=/usr/bin/qemu-{0}-static'.format(arch)
        build_args.append(opt)

    data['branch'] = branch
    data['runtime-version'] = runtime_version

    # Docs extension
    data['add-extensions']['org.gnome.Sdk.Docs']['version'] = runtime_version

    # Finish args
    finish_args = []
    for arg in data['finish-args']:
        finish_args.append(arg.replace('@@SDK_BRANCH@@', branch))
    data['finish-args'] = finish_args

    # Override the GTK package, as we have custom patches and build
    # options
    gtk_patches = {
        'all': [
            'gtk3-fix-atk-gjs-crash.patch',
            'gtk3-CSS-eos-cairo-filter-property.patch'
        ],
        'arm': [
            'gtk3-egl-x11.patch',
            '0001-temporary-commit.patch'
        ],
        'x86_64': [
        ]
    }

    gtk_config_opts = {
        'all': [
        ],
        'arm': [
            '--enable-egl-x11',
            '--build=arm-unknown-linux-gnueabi',
        ],
        'x86_64': [
        ],
    }

    # Override the WebKitGtk+ package, as we have custom build options
    webkitgtk_config_opts = {
        'arm': [
            '-DENABLE_GLES2=ON',
        ],
    }

    gst_plugins_good_patches = {
        'all': [
            'gtkgstwidget-add-ready-to-show-signal.patch',
        ],
        'arm': [
        ],
        'x86_64': [
        ]
    }

    u = request.urlopen(FREEDESKTOP_MANIFEST_URL)
    sdk_manifest = json.loads(re.sub(r'(^|\s)/\*.*?\*/', '', u.read().decode('utf-8'), flags=re.DOTALL))
    for m in sdk_manifest['modules']:
        if m['name'] == 'gtk3':
            gtk_module = m
            gtk_module['rm-configure'] = True
            gtk_module['ensure-writable'] = ['/lib/gtk-3.0/3.0.0/immodules.cache']
            for opt in (gtk_config_opts[arch] + gtk_config_opts['all']):
                gtk_module['config-opts'].append(opt)
            for patch in (gtk_patches[arch] + gtk_patches['all']):
                gtk_module['sources'].append({ 'type': 'patch', 'path': patch })
            data['modules'].insert(0, gtk_module)
            break
        if m['name'] == 'gstreamer-plugins-good':
            gst_module = m
            for patch in (gst_plugins_good_patches[arch] + gst_plugins_good_patches['all']):
                gst_module['sources'].append({ 'type': 'patch', 'path': patch })
            data['modules'].insert(0, gst_module)
            break
    # GNOME SDK's WebkitGTK+ module is only needed for our arm SDK
    if arch not in ['arm']:
        return
    version = runtime_version.replace('.', '-')
    u = request.urlopen(GNOME_MANIFEST_URL.format(version=version))
    sdk_manifest = json.loads(re.sub(r'(^|\s)/\*.*?\*/', '', u.read().decode('utf-8'), flags=re.DOTALL))
    for m in sdk_manifest['modules']:
        if m['name'] == 'WebKitGTK+':
            webkitgtk_module = m
            for arch in webkitgtk_config_opts:
                webkitgtk_module.setdefault('build-options', {}) \
                                .setdefault('arch', {}) \
                                .setdefault(arch, {}) \
                                .setdefault('config-opts', []) \
                                .extend(webkitgtk_config_opts[arch])
            data['modules'].insert(1, webkitgtk_module)
            break

def sha256(filename):
    checksum = hashlib.sha256()
    with open(filename, 'rb') as f:
        for data in iter(lambda: f.read(65536), b''):
            checksum.update(data)
    return checksum.hexdigest()

def add_fonts_module(data):
    """Add fonts module to manifest json"""

    sources = []

    for font in os.listdir('fonts'):
        if font.endswith('.zip'):
            path = 'fonts/' + font
            sources.append({ 'type': 'file',
                              'path': path,
                              'dest-filename': font.replace("+", "-"),
                              'sha256': sha256(path)})

    # Append the fonts to the end of the manifest, but before the
    # os-release scripts
    data['modules'].insert(-1, {
        'name': 'default-theme-fonts',
        'buildsystem': 'simple',
        'build-commands': [
            "mkdir -p /usr/share/fonts",
            "for font in *.zip; do unzip $font -d /usr/share/fonts/${font%.*}; done",
        ],
        'sources': sources,
    })

aparser = argparse.ArgumentParser(description='Add necessary build-args to manifest')
aparser.add_argument('--arch', metavar='ARCH',
                     help='build architecture')
aparser.add_argument('--sdk-branch',
                     help='Branch of the SDK to be built (default=master)',
                     dest='branch',
                     default='master')
aparser.add_argument('--base-runtime-version',
                     help='Version of the base runtime to be built',
                     dest='runtime_version')
aparser.add_argument('infile', metavar='FILE', nargs='?',
                     help='file to edit, stdin by default',
                     type=argparse.FileType('r'),
                     default=sys.stdin)
args = aparser.parse_args()

data = json.load(args.infile)
edit_manifest(data, args.arch, args.branch, args.runtime_version)
add_fonts_module(data)
print(json.dumps(data, indent=4))
