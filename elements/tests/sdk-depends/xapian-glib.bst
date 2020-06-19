kind: meson

(@): elements/sdk-depends/xapian-glib.bst

config:
  install-commands:
    (>):
    - |
      %{ninja} test
