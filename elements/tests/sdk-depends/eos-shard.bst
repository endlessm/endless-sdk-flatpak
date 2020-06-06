kind: autotools

(@): elements/sdk-depends/eos-shard.bst

config:
  install-commands:
    (>):
    - |
      %{make} check
