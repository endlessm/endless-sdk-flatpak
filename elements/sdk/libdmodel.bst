kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- sdk-build-depends/jasmine-gjs.bst

depends:
- freedesktop-sdk.bst:components/libarchive.bst
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk.bst:sdk/json-glib.bst
- gnome-sdk.bst:sdk/libsoup.bst
- sdk-depends/eos-shard.bst
- sdk-depends/libzim-glib.bst
- sdk-depends/xapian-glib.bst
- sdk/eos-sdk.bst

variables:
  (?):
  - eos_tests:
      meson-local: |
        -Djasmine_junit_reports_dir="%{build-root}/_reports"

sources:
- kind: git_tag
  url: github_com:endlessm/libdmodel.git
  track: master
  ref: 359064e22030b764760312b5a2c180ae0491f9a8
