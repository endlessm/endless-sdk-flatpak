kind: autotools

build-depends:
- freedesktop-sdk.bst:components/xorg-util-macros.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:components/xorg-lib-xt.bst
- tests-build-depends/xorg-server-xvfb.bst

sources:
- kind: git_tag
  url: gitlab_freedesktop_org:xorg/lib/libxmu.git
  track: master
  match:
  - libXmu-*
  exclude:
  - libXmu-*.99.*
