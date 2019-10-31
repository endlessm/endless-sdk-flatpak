kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

sources:
- kind: git_tag
  url: github_com:sass/libsass.git
  track: 3.4.9
  ref: 3.4.9-0-g6de5050d11a1789d9922eb24e2925047ecbb499b
