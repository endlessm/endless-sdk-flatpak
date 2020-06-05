kind: meson

(@): elements/sdk-depends/emeus.bst

config:
  install-commands:
    (>):
    - |
      %{ninja} test
