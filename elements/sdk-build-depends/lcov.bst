kind: manual

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

config:
  build-commands:
  - make
  install-commands:
  - make install \
    PREFIX=%{install-root} \
    CFG_DIR=%{install-root}%{sysconfdir} \
    BIN_DIR=%{install-root}%{bindir} \
    MAN_DIR=%{install-root}%{mandir}

sources:
- kind: git_tag
  url: github_com:linux-test-project/lcov.git
  track: v1.14
