kind: meson

(@): elements/sdk-depends/maxwell.bst

config:
  install-commands:
    (>):
    - |
      %{ninja} test
