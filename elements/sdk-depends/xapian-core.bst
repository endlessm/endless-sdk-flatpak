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
- kind: patch
  path: files/xapian/0001-Prevent-tar-from-changing-file-ownership-in-all-envi.patch
- kind: remote
  directory: BUILD
  url: github_com:xapian/xapian-dev-deps/releases/download/current/autoconf-2.69.tar.xz
- kind: remote
  directory: BUILD
  url: github_com:xapian/xapian-dev-deps/releases/download/current/automake-1.16.1.tar.xz
- kind: remote
  directory: BUILD
  url: github_com:xapian/xapian-dev-deps/releases/download/current/libtool-2.4.6.tar.xz
