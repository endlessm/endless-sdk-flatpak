kind: pip

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- freedesktop-sdk.bst:components/libxml2.bst
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk.bst:sdk/json-glib.bst

sources:
- kind: tar
  url: https://files.pythonhosted.org/packages/c7/bf/5f243e2d2deeeea8a192694825b3fccc3d960acc4ee55b37c85dd2b22a8c/hotdoc-0.10.0.tar.gz
