kind: pip

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- freedesktop-sdk.bst:components/dbus.bst
- gnome-sdk.bst:sdk/glib.bst

sources:
- kind: git_tag
  url: git_freedesktop_org:dbus/dbus-python.git
  track: dbus-python-1.2.12
  ref: dbus-python-1.2.12-0-g5426797ad2f243aeef3e934d35334ab7183bfb6d
