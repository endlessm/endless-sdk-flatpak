kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- sdk-build-depends/jasmine-gjs.bst

depends:
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk.bst:sdk/json-glib.bst
- sdk-depends/mustache-c.bst
- sdk-depends/sassc.bst
- sdk/eos-sdk.bst

variables:
  (?):
  - eos_tests:
      meson-local: |
        -Djasmine_junit_reports_dir="%{build-root}/_reports"

sources:
- kind: git_tag
  url: github_com:endlessm/eos-knowledge-content-renderer.git
  track: master
  ref: a9b0ea201991a73dc136b35ec90990f102601c0a
