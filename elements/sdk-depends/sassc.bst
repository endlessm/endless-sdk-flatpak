kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- sdk-depends/libsass.bst

sources:
- kind: git_tag
  url: github_com:sass/sassc.git
  track: 3.4.8
