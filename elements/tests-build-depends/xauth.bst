kind: autotools

build-depends:
- freedesktop-sdk.bst:components/xorg-proto-xorgproto.bst
- freedesktop-sdk.bst:components/xorg-util-macros.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- tests-build-depends/libxmu.bst
- tests-build-depends/xorg-server-xvfb.bst

sources:
- kind: git_tag
  url: gitlab_freedesktop_org:xorg/app/xauth.git
  track: master
  match:
  - xauth-*
  exclude:
  - xauth-*.99.*

