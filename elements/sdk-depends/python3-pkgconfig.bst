kind: pip

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- freedesktop-sdk.bst:components/pkg-config.bst

sources:
- kind: git_tag
  url: github_com:matze/pkgconfig.git
  track: v1.5.1
  ref: 5.1.2-0-g0f64cbfa54b0b22dc7b776b7b98a7cd657e84d78
