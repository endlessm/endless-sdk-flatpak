kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- freedesktop-sdk.bst:bootstrap/zlib.bst
- freedesktop-sdk.bst:components/icu.bst
- sdk-depends/xapian-core.bst

sources:
- kind: git_tag
  url: github_com:openzim/libzim
  track: 6.1.1
  ref: 6.1.1-0-gec13dd11ac4246fba2188896434d0bc25ae38a00
