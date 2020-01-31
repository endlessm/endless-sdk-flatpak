kind: pip

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- gnome-sdk.bst:core-deps/libyaml.bst

sources:
- kind: git_tag
  url: github_com:yaml/pyyaml.git
  track: 5.1.2
  ref: 5.1.2-0-g0f64cbfa54b0b22dc7b776b7b98a7cd657e84d78
