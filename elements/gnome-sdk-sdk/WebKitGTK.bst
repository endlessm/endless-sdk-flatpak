# Replaces sdk/WebKitGTK.bst from gnome-sdk.
<https://gitlab.gnome.org/GNOME/gnome-build-meta/blob/gnome-3-34/elements/sdk/WebKitGTK.bst>

# Because the upstream version of this is required by other elements in
# gnome-sdk, we need to keep the existing element intact, and put this one on
# top of it during integration by using an overlap whitelist.

kind: cmake

sources:
- kind: tar
  url: webkitgtk_org:webkitgtk-2.26.2.tar.xz
  ref: 6b80f0637a80818559ac8fd50db3b394f41cb61904fb9b3ed65fa51635806512
- kind: patch
  path: gnome-sdk-files/webkitgtk/gtk-doc-introspection-cross-compiling.patch
- kind: local
  path: gnome-sdk-files/webkitgtk/toolchain.i686
- kind: local
  path: gnome-sdk-files/webkitgtk/toolchain.arm

build-depends:
- freedesktop-sdk.bst:components/gperf.bst
- freedesktop-sdk.bst:components/perl.bst
- freedesktop-sdk.bst:components/ruby.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- freedesktop-sdk.bst:bootstrap-import.bst
- freedesktop-sdk.bst:components/hyphen.bst
- freedesktop-sdk.bst:components/libtasn1.bst
- freedesktop-sdk.bst:components/libwebp.bst
- freedesktop-sdk.bst:components/libxslt.bst
- freedesktop-sdk.bst:components/wayland.bst
- freedesktop-sdk.bst:components/xorg-lib-xt.bst
- gnome-sdk-sdk/gtk+-3.bst
- gnome-sdk.bst:sdk/at-spi2-core.bst
- gnome-sdk.bst:sdk/brotli.bst
- gnome-sdk.bst:sdk/enchant-2.bst
- gnome-sdk.bst:sdk/geoclue.bst
- gnome-sdk.bst:sdk/gobject-introspection.bst
- gnome-sdk.bst:sdk/gst-plugins-base.bst
- gnome-sdk.bst:sdk/libnotify.bst
- gnome-sdk.bst:sdk/libsecret.bst
- gnome-sdk.bst:sdk/libsoup.bst
- gnome-sdk.bst:sdk/libwpe.bst
- gnome-sdk.bst:sdk/openjpeg.bst
- gnome-sdk.bst:sdk/pango.bst
- gnome-sdk.bst:sdk/woff2.bst
- gnome-sdk.bst:sdk/wpebackend-fdo.bst

runtime-depends:
- gnome-sdk-sdk/gst-plugins-good.bst
- gnome-sdk.bst:sdk/gst-libav.bst
- gnome-sdk.bst:sdk/gst-plugins-bad.bst

# dummy dependency so this is staged on top of the element from gnome-sdk
- gnome-sdk.bst:sdk/WebKitGTK.bst

variables:
  webkitgtk_toolchain: ''
  endless_arch_options: ''
  (?):
  - arch == "i686" or arch == "arm":
      webkitgtk_toolchain: -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=toolchain.%{arch}
  - arch == "arm":
      endless_arch_options: |
        -DENABLE_GLES2=ON
  cmake-local: >-
    -DPORT=GTK
    -DENABLE_BUBBLEWRAP_SANDBOX=OFF
    %{webkitgtk_toolchain}
    %{endless_arch_options}
(?):
- arch == "i686":
    environment:
      CFLAGS: '%{flags_i686} -g1'
      CXXFLAGS: '%{flags_i686} -g1'
- arch == "arm":
    environment:
      CFLAGS: '%{flags_arm} -g1'
      CXXFLAGS: '%{flags_arm} -g1'

public:
  bst:
    overlap-whitelist:
    - '**'
  cpe:
    product: webkitgtk+
