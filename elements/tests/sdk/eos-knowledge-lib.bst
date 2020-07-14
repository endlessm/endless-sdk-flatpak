kind: autotools

(@): elements/sdk/eos-knowledge-lib.bst

build-depends:
  (>):
  - sdk-build-depends/jasmine-gjs.bst
  - tests-build-depends/xvfb-run.bst
  - sdk/fonts-firasans.bst
  - sdk/fonts-lato.bst
  - sdk/fonts-librebaskerville.bst
  - sdk/fonts-merriweather.bst
  - sdk/fonts-raleway.bst
  - sdk/fonts-roboto.bst

environment:
  JASMINE_JUNIT_REPORTS_DIR: "%{build-root}/_reports"

config:
  install-commands:
    (>):
    - |
      xvfb-run -s '-screen 0 800x600x24' --auto-servernum -e /dev/stderr \
      %{make} check
