# Replaces sdk/gstreamer-plugins-good.bst from freedesktop-sdk.

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
  url: git_freedesktop_org:gstreamer/gst-plugins-good
  track: '1.16'
  submodules:
    common:
      checkout: false
      url: git_freedesktop_org:gstreamer/common
  ref: 1.16.1-3-g0141c2f010574165b3b12be51e395778d39a6640
- kind: patch
  path: files/gstreamer-plugins-good/0001-gtkgstwidget-add-ready-to-show-signal.patch
