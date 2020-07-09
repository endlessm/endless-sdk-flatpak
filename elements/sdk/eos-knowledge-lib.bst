kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- sdk-build-depends/eos-hotdoc-theme.bst
- sdk-build-depends/hotdoc-modular-framework.bst
- sdk-build-depends/hotdoc.bst
- sdk-build-depends/lcov.bst

depends:
- freedesktop-sdk.bst:components/gstreamer.bst
- gnome-sdk-sdk/WebKitGTK.bst
- gnome-sdk.bst:core/evince.bst
- gnome-sdk.bst:sdk/gjs.bst
- sdk-depends/emeus.bst
- sdk-depends/eos-knowledge-content-renderer.bst
- sdk-depends/mathjax.bst
- sdk-depends/maxwell.bst
- sdk-depends/python3-polib.bst
- sdk-depends/python3-pyyaml.bst
- sdk-depends/sassc.bst
- sdk/eos-sdk.bst
- sdk/libdmodel.bst

variables:
  conf-local: |
    --disable-js-doc \
    --enable-documentation \
    --with-mathjax-dir="%{datadir}/javascript/mathjax"

environment:
  HOTDOC: "%{bindir}/python3 %{bindir}/hotdoc"

sources:
- kind: git_tag
  url: github_com:endlessm/eos-knowledge-lib.git
  track: master
  ref: Release_3.2.6-739-gbcbd6db7e50023f635dba5148511d0b93095e37f
