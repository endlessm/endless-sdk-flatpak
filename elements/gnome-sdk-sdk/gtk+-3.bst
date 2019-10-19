# Replaces sdk/gtk+-3.bst from gnome-sdk.

# Because the upstream version of this is required by other elements in
# gnome-sdk, we need to keep the existing element intact, and put this one on
# top of it during integration by using an overlap whitelist.

kind: autotools

sources:
- kind: git_tag
  url: github_com:endlessm/gtk
  track: eos3.7
- kind: patch
  path: files/gtk+-3/0001-CSS-add-vendor-specific-eos-cairo-filter-property.patch

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- gnome-sdk.bst:sdk/gtk-doc.bst

depends:
- freedesktop-sdk.bst:bootstrap-import.bst
- freedesktop-sdk.bst:components/cairo.bst
- freedesktop-sdk.bst:components/hicolor-icon-theme.bst
- freedesktop-sdk.bst:components/libepoxy.bst
- freedesktop-sdk.bst:components/libxkbcommon.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- freedesktop-sdk.bst:components/wayland-protocols.bst
- freedesktop-sdk.bst:components/wayland.bst
- freedesktop-sdk.bst:components/xorg-lib-xcomposite.bst
- freedesktop-sdk.bst:components/xorg-lib-xcursor.bst
- freedesktop-sdk.bst:components/xorg-lib-xdamage.bst
- freedesktop-sdk.bst:components/xorg-lib-xi.bst
- freedesktop-sdk.bst:components/xorg-lib-xinerama.bst
- gnome-sdk.bst:sdk/at-spi2-atk.bst
- gnome-sdk.bst:sdk/atk.bst
- gnome-sdk.bst:sdk/gdk-pixbuf.bst
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk.bst:sdk/gobject-introspection.bst
- gnome-sdk.bst:sdk/pango.bst

# dummy dependency so this is staged on top of the element from gnome-sdk
runtime-depends:
- gnome-sdk.bst:sdk/gtk+-3.bst

variables:
  endless_arch_options: ''
  (?):
    - arch == "arm":
        endless_arch_options: |
          --enable-egl-x11 \
          --build=arm-unknown-linux-gnueabi
  conf-local: |
    --enable-broadway-backend \
    --enable-installed-tests \
    --enable-x11-backend \
    --enable-wayland-backend \
    %{endless_arch_options}

public:
  bst:
    integration-commands:
    - |-
      for dir in %{prefix}/share/icons/*; do
        if test -f $dir/index.theme; then
          gtk-update-icon-cache --quiet $dir
        fi
      done
    - gtk-query-immodules-3.0 --update-cache
    overlap-whitelist:
    - '**'
  cpe:
    product: gtk+
