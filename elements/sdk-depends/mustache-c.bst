kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:components/bison.bst
- freedesktop-sdk.bst:components/flex.bst

sources:
- kind: git_tag
  url: github_com:x86-64/mustache-c.git
  track: c1948c599edfe48c6099ed70ab1d5911d8c3ddc8
  ref: v1.0-42-gc1948c599edfe48c6099ed70ab1d5911d8c3ddc8
