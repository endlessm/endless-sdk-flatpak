kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- sdk-build-depends/googletest.bst

depends:
- freedesktop-sdk.bst:bootstrap/zlib.bst
- freedesktop-sdk.bst:components/icu.bst
- sdk-depends/xapian-core.bst
- sdk-depends/zstd.bst

sources:
- kind: git_tag
  url: github_com:openzim/libzim
  track: 6.3.0
- kind: patch
  path: files/libzim/0001-Fallback-to-xapian-core-1.5-dependency-if-xapian-cor.patch
