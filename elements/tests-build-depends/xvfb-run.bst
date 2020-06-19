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
  ref: xorg-server-2_1.20.8-2-0-g6ff26b8d4a9492ad4b1edf2577b16911a860440c
