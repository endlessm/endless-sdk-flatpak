kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- sdk-build-depends/eos-hotdoc-theme.bst
- sdk-build-depends/hotdoc-modular-framework.bst
- sdk-build-depends/hotdoc.bst
- sdk-build-depends/jasmine-gjs.bst

depends:
- freedesktop-sdk.bst:components/gstreamer.bst
- gnome-sdk.bst:sdk/WebKitGTK.bst
- gnome-sdk.bst:core/evince.bst
- gnome-sdk.bst:sdk/gjs.bst
- sdk-depends/emeus.bst
- sdk-depends/eos-knowledge-content-renderer.bst
- sdk-depends/mathjax.bst
- sdk-depends/maxwell.bst
- sdk-depends/python-polib.bst
- sdk-depends/python-pyyaml.bst
- sdk-depends/sassc.bst
- sdk/eos-sdk.bst
- sdk/libdmodel.bst

variables:
  conf-local: |
    --disable-js-doc \
    --disable-documentation \
    --with-mathjax-dir="%{datadir}/javascript/mathjax"

environment:
  HOTDOC: "%{bindir}/python3 %{bindir}/hotdoc"

sources:
- kind: git_tag
  url: github_com:endlessm/eos-knowledge-lib.git
  track: dylanmccall-gnome-3-32
  ref: Release_3.2.6-697-g2a4512cb1f46494f1ebe0f52f1b0d3c491a2b3a3