kind: autotools

(@): elements/sdk/eos-metrics.bst

config:
  install-commands:
    (>):
    - |
      %{make} check
