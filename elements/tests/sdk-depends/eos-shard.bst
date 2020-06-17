kind: autotools

(@): elements/sdk-depends/eos-shard.bst

build-depends:
  (>):
  - sdk-build-depends/jasmine-gjs.bst

config:
  install-commands:
    (>):
    - |
      %{make} check
