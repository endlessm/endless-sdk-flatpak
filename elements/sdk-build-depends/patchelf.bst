kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

sources:
- kind: git_tag
  url: github_com:NixOS/patchelf
  track: '0.10'
  ref: 0.10-0-ge1e39f3639e39360ceebb2f7ed533cede4623070
