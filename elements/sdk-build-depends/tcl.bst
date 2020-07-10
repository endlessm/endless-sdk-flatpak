kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

variables:
  command-subdir: unix
  conf-local: |
    --enable-man-suffix=tcl

config:
  install-commands:
    (>):
    - |
      ln -sr "%{install-root}%{bindir}/tclsh8.6" "%{install-root}%{bindir}/tclsh"

sources:
- kind: git_tag
  url: github_com:tcltk/tcl
  track: core-8-6-10
