#!/usr/bin/env python3

import argparse
import gi
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

    # This is nasty
    gtk_patches = [ 'gtk3-fix-atk-gjs-crash.patch' ]
    u = request.urlopen(FREEDESKTOP_MANIFEST_URL)
    sdk_manifest = json.loads(re.sub(r'(^|\s)/\*.*?\*/', '', u.read().decode('utf-8'), flags=re.DOTALL))
    for m in sdk_manifest['modules']:
        if m['name'] == 'gtk3':
            gtk_module = m
            if arch == 'arm':
                gtk_module['config-opts'].append('--enable-egl-x11')
                gtk_module['config-opts'].append('--build=arm-unknown-linux-gnueabi')
                gtk_patches.append('gtk3-egl-x11.patch')
            gtk_module['rm-configure'] = True
            gtk_module['ensure-writable'] = ['/lib/gtk-3.0/3.0.0/immodules.cache']
            for patch in gtk_patches:
                gtk_module['sources'].append({ 'type': 'patch', 'path': patch })
            data['modules'].insert(0, gtk_module)
            break

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
print(json.dumps(data, indent=4))
