kind: flatpak_repo

build-depends:
- freedesktop-sdk.bst:deploy-tools/flatpak.bst
- flatpak/org-freedesktop-platform-icontheme-endlessos.bst

config:
  environment:
  - deploy-tools/flatpak.bst
  arch: '%{gcc_arch}'
  branch: '1.0'
  repo-mode: bare-user-only
