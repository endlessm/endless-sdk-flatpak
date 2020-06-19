kind: manual

build-depends:
- freedesktop-sdk.bst:bootstrap-import.bst

# dummy dependency so this is staged on top of dbus.bst
runtime-depends:
- freedesktop-sdk.bst:components/dbus.bst

config:
  install-commands:
  - |
    install -D -t "%{install-root}%{datadir}/dbus-1" session.conf
  - |
    install -D -t "%{install-root}%{datadir}/dbus-1" system.conf

public:
  bst:
    overlap-whitelist:
    - '**'

sources:
- kind: local
  path: files/dbus-test-environment/session.conf
- kind: local
  path: files/dbus-test-environment/system.conf
