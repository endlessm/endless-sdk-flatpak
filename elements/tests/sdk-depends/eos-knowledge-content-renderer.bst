kind: meson

(@): elements/sdk-depends/eos-knowledge-content-renderer.bst

variables:
  meson-local: |
    -Djasmine_junit_reports_dir="%{build-root}/_reports"

config:
  install-commands:
    (>):
    - |
      %{ninja} test
