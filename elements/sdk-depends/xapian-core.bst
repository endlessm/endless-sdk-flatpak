kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- freedesktop-sdk.bst:components/git.bst
- freedesktop-sdk.bst:components/curl.bst
- freedesktop-sdk.bst:components/pcre.bst
- sdk-build-depends/xapian-core-swig.bst
- sdk-build-depends/tcl.bst

variables:
  conf-local: |
    --enable-maintainer-mode \
    --disable-documentation

config:
  configure-commands:
    (<):
    - |
      ./bootstrap --download-tools=never xapian-core

environment:
  SWIG: /usr/bin/swig

sources:
- kind: git_tag
  url: git_xapian_org:xapian
  track: 6851942c7820b410679e68a92fad55325c7164ef
  ref: v1.4.0-1506-g6851942c7820b410679e68a92fad55325c7164ef
- kind: patch
  path: files/xapian/0001-Prevent-tar-from-changing-file-ownership-in-all-envi.patch
- kind: remote
  directory: BUILD
  url: github_com:xapian/xapian-dev-deps/releases/download/current/autoconf-2.69.tar.xz
  ref: 64ebcec9f8ac5b2487125a86a7760d2591ac9e1d3dbd59489633f9de62a57684
- kind: remote
  directory: BUILD
  url: github_com:xapian/xapian-dev-deps/releases/download/current/automake-1.16.1.tar.xz
  ref: 5d05bb38a23fd3312b10aea93840feec685bdf4a41146e78882848165d3ae921
- kind: remote
  directory: BUILD
  url: github_com:xapian/xapian-dev-deps/releases/download/current/libtool-2.4.6.tar.xz
  ref: 7c87a8c2c8c0fc9cd5019e402bed4292462d00a718a7cd5f11218153bf28b26f
