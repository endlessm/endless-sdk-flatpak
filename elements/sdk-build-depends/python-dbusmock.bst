kind: pip

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- sdk-depends/python-dbus.bst

sources:
- kind: git_tag
  url: github_com:martinpitt/python-dbusmock.git
  track: 0.18.3
