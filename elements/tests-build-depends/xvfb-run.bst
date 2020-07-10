kind: manual

build-depends:
- freedesktop-sdk.bst:bootstrap-import.bst

depends:
- tests-build-depends/xauth.bst
- tests-build-depends/xorg-server-xvfb.bst

config:
  install-commands:
  - |
    install -Dm755 -t "%{install-root}%{bindir}" debian/local/xvfb-run

sources:
- kind: git_tag
  url: salsa_debian_org:xorg-team/xserver/xorg-server.git
  track: debian-unstable
