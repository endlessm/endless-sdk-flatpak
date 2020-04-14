kind: autotools

build-depends:
- freedesktop-sdk.bst:components/git.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- gnome-sdk.bst:sdk/gtk-doc.bst
- sdk-build-depends/jasmine-gjs.bst

depends:
- gnome-sdk-sdk/gtk+-3.bst
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk.bst:sdk/gobject-introspection.bst
- gnome-sdk.bst:sdk/json-glib.bst
- sdk/eos-metrics.bst

variables:
  conf-local: |
    --disable-gtk-doc \
    --disable-gir-doc \
    --disable-js-doc \
    --disable-webhelper

environment:
  (?):
  - eos_tests:
      JASMINE_JUNIT_REPORTS_DIR: "%{build-root}/_reports"
      EOS_COVERAGE_DIR: "%{build-root}/_coverage"

sources:
- kind: git_tag
  url: github_com:endlessm/eos-sdk.git
  track: master
  ref: Release_3.3.20-63-ge8ba17c190ca9e1c985036c6498a55690f684f86
