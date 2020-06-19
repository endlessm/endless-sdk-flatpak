kind: meson

(@): elements/sdk/libdmodel.bst

build-depends:
  (>):
  - sdk-build-depends/jasmine-gjs.bst

variables:
  meson-local: |
    -Djasmine_junit_reports_dir="%{build-root}/_reports"

config:
  install-commands:
    (>):
    - |
      %{ninja} test
