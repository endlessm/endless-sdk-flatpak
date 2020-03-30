# Replaces sdk/gst-plugins-good.bst from gnome-sdk.
# <https://gitlab.gnome.org/GNOME/gnome-build-meta/blob/gnome-3-36/elements/sdk/gst-plugins-good.bst>

# Because the upstream version of this is required by other elements in
# gnome-sdk, we need to keep the existing element intact, and put this one on
# top of it during integration by using an overlap whitelist.

# Changes from upstream:
# - Depend on custom version of gstreamer-plugins-good.bst from
#   freedesktop-sdk-components.

kind: filter

build-depends:
- freedesktop-sdk-components/gstreamer-plugins-good.bst

runtime-depends:
- freedesktop-sdk.bst:bootstrap-import.bst
- freedesktop-sdk.bst:components/cairo.bst
- freedesktop-sdk.bst:components/gstreamer.bst
- freedesktop-sdk.bst:components/jpeg.bst
- freedesktop-sdk.bst:components/lame.bst
- freedesktop-sdk.bst:components/libflac.bst
- freedesktop-sdk.bst:components/libpng.bst
- freedesktop-sdk.bst:components/libpulse.bst
- freedesktop-sdk.bst:components/libvpx.bst
- freedesktop-sdk.bst:components/mpg123.bst
- freedesktop-sdk.bst:components/orc.bst
- freedesktop-sdk.bst:components/speex.bst
- freedesktop-sdk.bst:components/wavpack.bst
- gnome-sdk-sdk/gtk+-3.bst
- gnome-sdk.bst:sdk/gdk-pixbuf.bst
- gnome-sdk.bst:sdk/gst-plugins-base.bst
- gnome-sdk.bst:sdk/libsoup.bst

# dummy dependency so this is staged on top of the element from gnome-sdk
- gnome-sdk.bst:sdk/gst-plugins-good.bst

public:
  bst:
    overlap-whitelist:
    - '**'
