kind: make

depends:
- freedesktop-sdk.bst:bootstrap-import.bst

variables:
  make-args: >-
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"
  make: make %{make-args}
  make-install: make -j1 install DESTDIR="%{install-root}" %{make-args}

config:
  install-commands:
    (>):
    - |
      rm -f '%{install-root}%{libdir}'/*.a

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libzstd.so'

sources:
- kind: git_tag
  url: github_com:facebook/zstd.git
  track: master
