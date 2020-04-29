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
  ref: 3ec3815ac020f80750a2f48297c10361b0b8c345
