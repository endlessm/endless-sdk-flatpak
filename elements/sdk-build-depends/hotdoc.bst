kind: pip

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- freedesktop-sdk.bst:components/libxml2.bst
- freedesktop-sdk.bst:components/python3-setuptools.bst
- freedesktop-sdk.bst:components/git.bst
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk.bst:sdk/json-glib.bst
- sdk-build-depends/python3-appdirs.bst
- sdk-build-depends/python3-lxml.bst
- sdk-build-depends/python3-schema.bst
- sdk-build-depends/python3-sqlalchemy.bst
- sdk-build-depends/python3-toposort.bst
- sdk-build-depends/python3-wheezy.bst

sources:
- kind: tar
  url: https://pypi.python.org/packages/0b/8e/07d19b56d5e4fc79d86f2dff69674841c8dec30a008dbda36d0d2dbc6e50/hotdoc-0.8.92.tar.gz
