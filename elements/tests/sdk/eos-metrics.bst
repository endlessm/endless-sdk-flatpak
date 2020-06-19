kind: autotools

(@): elements/sdk/eos-metrics.bst

build-depends:
  (>):
  - tests-build-depends/dbus-test-environment.bst

config:
  install-commands:
    (>):
    - |
      %{make} check
