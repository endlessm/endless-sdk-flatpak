kind: autotools

(@): elements/sdk/basin.bst

config:
  install-commands:
    (>):
    - |
      %{make} check
