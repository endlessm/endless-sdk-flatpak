kind: manual

build-depends:
- freedesktop-sdk.bst:bootstrap-import.bst

variables:
  fontsdir: "%{install-root}%{datadir}/fonts"

(@): include/source-google-fonts.yml

config:
  install-commands:
  - |
    install -m 0755 -d "%{fontsdir}/librebaskerville"
    install -p -m 0644 ofl/librebaskerville/* "%{fontsdir}/librebaskerville"
