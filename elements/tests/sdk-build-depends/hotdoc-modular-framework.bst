kind: pip

(@): elements/sdk-build-depends/hotdoc-modular-framework.bst

config:
  install-commands:
    (>):
    - |
      python3 setup.py test
