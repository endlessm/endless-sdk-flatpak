# Replaces sdk/gstreamer-plugins-good.bst from freedesktop-sdk.
# <https://gitlab.com/freedesktop-sdk/freedesktop-sdk/blob/19.08/elements/components/gstreamer-plugins-good.bst>

# Changes from upstream:
# - Add patches specific to Endless OS, such as for hardware acceleration
#   on Endless Mini, and adding a ready-to-show signal used by certain
#   applications.

kind: meson

build-depends:
- freedesktop-sdk.bst:components/gobject-introspection.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- freedesktop-sdk.bst:bootstrap-import.bst
- freedesktop-sdk.bst:components/cairo.bst
- freedesktop-sdk.bst:components/gdk-pixbuf.bst
- freedesktop-sdk.bst:components/gstreamer-plugins-base.bst
- freedesktop-sdk.bst:components/gstreamer.bst
- freedesktop-sdk.bst:components/gtk3.bst
- freedesktop-sdk.bst:components/jpeg.bst
- freedesktop-sdk.bst:components/lame.bst
- freedesktop-sdk.bst:components/libflac.bst
- freedesktop-sdk.bst:components/libpng.bst
- freedesktop-sdk.bst:components/libpulse.bst
- freedesktop-sdk.bst:components/libsoup.bst
- freedesktop-sdk.bst:components/libvpx.bst
- freedesktop-sdk.bst:components/mpg123.bst
- freedesktop-sdk.bst:components/orc.bst
- freedesktop-sdk.bst:components/speex.bst
- freedesktop-sdk.bst:components/wavpack.bst

variables:
  meson-local: >-
    -Dpackage-origin="endless-sdk"
    -Dv4l2-libv4l2=disabled
    -Dv4l2-gudev=disabled
    -Daalib=disabled
    -Djack=disabled
    -Dlibcaca=disabled
    -Ddv=disabled
    -Ddv1394=disabled
    -Dqt5=disabled
    -Dshout2=disabled
    -Dtaglib=disabled
    -Dtwolame=disabled
    -Dexamples=disabled

sources:
- kind: git_tag
  url: gitlab_freedesktop_org:gstreamer/gst-plugins-good
  # Changed to track git commit from upstream bst
  # track: '1.16'
  track: 'ce0723527aa37d5f4d19ef8021c0b2eb8f83b08d'
  submodules:
    common:
      checkout: false
      url: gitlab_freedesktop_org:gstreamer/common
  ref: 1.16.2-0-gce0723527aa37d5f4d19ef8021c0b2eb8f83b08d
- kind: patch
  path: files/gstreamer-plugins-good/0001-gtkgstwidget-add-ready-to-show-signal.patch
