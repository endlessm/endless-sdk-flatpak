kind: compose

build-depends:
- flatpak/manifests/platform-manifest.bst
- freedesktop-sdk.bst:integration/split-docs.bst
- freedesktop-sdk.bst:integration/split-locales.bst
- freedesktop-sdk.bst:multiarch/multiarch-platform.bst
- platform.bst

config:
  exclude:
  - devel
  - extra
  - static-blocklist
  - vm-only

public:
  bst:
    split-rules:
      docs:
      - '%{datadir}/runtime/docs/**'
      locale:
      - '%{datadir}/runtime/locale/**'
