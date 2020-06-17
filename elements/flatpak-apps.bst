kind: flatpak_repo

build-depends:
- flatpak/com-endlessm-eknservices3-debug.bst
- flatpak/com-endlessm-eknservices3-extension.bst
- flatpak/com-endlessm-eknservices3.bst
- freedesktop-sdk.bst:deploy-tools/flatpak.bst

config:
  environment:
  - deploy-tools/flatpak.bst
  arch: '%{gcc_arch}'
  branch: '%{ekn-services-branch}'
  repo-mode: bare-user-only
