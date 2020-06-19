# Based on components/xorg-server.bst from freedesktop-sdk.
# <https://gitlab.com/freedesktop-sdk/freedesktop-sdk/blob/19.08/elements/components/xorg-server.bst>

# Changes from upstream:
# - Enable xvfb for running test suites inside a sandbox.
# - Remove wayland and systemd dependencies. These are not needed for xvfb.

kind: autotools

build-depends:
- freedesktop-sdk.bst:components/xorg-proto-xorgproto.bst
- freedesktop-sdk.bst:components/xorg-util-macros.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:bootstrap-import.bst
- freedesktop-sdk.bst:components/dummy-gbm.bst
- freedesktop-sdk.bst:components/libdrm.bst
- freedesktop-sdk.bst:components/libepoxy.bst
- freedesktop-sdk.bst:components/libtirpc.bst
- freedesktop-sdk.bst:components/nettle.bst
- freedesktop-sdk.bst:components/pixman.bst
- freedesktop-sdk.bst:components/xorg-app-xkbcomp.bst
- freedesktop-sdk.bst:components/xorg-data-xkeyboard-config.bst
- freedesktop-sdk.bst:components/xorg-font-util.bst
- freedesktop-sdk.bst:components/xorg-lib-xdmcp.bst
- freedesktop-sdk.bst:components/xorg-lib-xfont2.bst
- freedesktop-sdk.bst:components/xorg-lib-xkbfile.bst
- freedesktop-sdk.bst:components/xorg-lib-xshmfence.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:components/wayland.bst
- freedesktop-sdk.bst:components/wayland-protocols.bst

variables:
  conf-local: |
    --enable-xvfb

sources:
- kind: git_tag
  url: gitlab_freedesktop_org:xorg/xserver.git
  track: master
  track-extra:
  - server-1.20-branch
  match:
  - xorg-server-*
  exclude:
  - xorg-server-*.99.*
  ref: xorg-server-1.20.7-0-g489f4191f3c881c6c8acce97ec612167a4ae0f33
