kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- sdk-depends/libsass.bst

sources:
- kind: git_tag
  url: github_com:sass/sassc.git
  track: 3.4.8
  ref: 3.4.8-0-gaa6d5c635ea8faf44d542a23aaf85d27e5777d48
