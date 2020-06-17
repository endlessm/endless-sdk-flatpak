kind: autotools

(@): elements/sdk/eos-knowledge-lib.bst

build-depends:
  (>):
  - sdk-build-depends/jasmine-gjs.bst
  - tests-build-depends/xvfb-run.bst

environment:
  JASMINE_JUNIT_REPORTS_DIR: "%{build-root}/_reports"
  EOS_COVERAGE_DIR: "%{build-root}/_coverage"

config:
  install-commands:
    (>):
    - |
      xvfb-run -s '-screen 0 800x600x24' --auto-servernum -e /dev/stderr \
      %{make} check
