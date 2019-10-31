kind: manual

build-depends:
- freedesktop-sdk.bst:bootstrap-import.bst
- freedesktop-sdk.bst:components/tar.bst
- freedesktop-sdk.bst:components/xz.bst

config:
  install-commands:
  - mkdir -p %{install-root}%{datadir}
  - cp -a eos-hotdoc-theme %{install-root}%{datadir}

sources:
- kind: tar
  url: https://endlessm.github.io/eos-hotdoc-theme/releases/eos-hotdoc-theme-0.0.0.tar.xz
  directory: eos-hotdoc-theme
  ref: 38c0e9b4e30636fcc595e5f45504c08a912505a7c31b0d2ab1a27f0947c9b41e
