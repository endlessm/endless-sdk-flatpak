kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

sources:
- kind: git_tag
  url: github_com:NixOS/patchelf
  track: '0.10'
