kind: compose

build-depends:
- apps/eknservices3.bst
- flatpak/manifests/eknservices3-manifest.bst

config:
  exclude:
  - devel
  - extra
  - static-blocklist
  - vm-only
