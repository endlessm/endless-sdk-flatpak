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
  meson-local: |
    -Djasmine_junit_reports_dir="%{build-root}/_reports"

sources:
- kind: git_tag
  url: github_com:endlessm/eos-knowledge-content-renderer.git
  track: master
  ref: 576f07d8eb844c4806b925b3cbe469176c712ac0
