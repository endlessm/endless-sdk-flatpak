kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

variables:
  command-subdir: unix

config:
  install-commands:
    (>):
    - |
      ln -sr "%{install-root}%{bindir}/tclsh8.6" "%{install-root}%{bindir}/tclsh"

sources:
- kind: git_tag
  url: github_com:tcltk/tcl
  track: core-8-6-10
  ref: core-8-6-10-0-g2abfa2c03ddc0419e6525f86c2c0323b2ba1932e
