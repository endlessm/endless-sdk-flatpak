kind: manual

build-depends:
- freedesktop-sdk.bst:bootstrap-import.bst

variables:
  fontsdir: "%{install-root}%{datadir}/fonts"

config:
  install-commands:
  - |
    install -m 0755 -d "%{fontsdir}/notoserif"
    install -p -m 0644 * "%{fontsdir}/notoserif"

sources:
- kind: remote
  url: raw_githubusercontent_com:google/fonts/c698ee1cbe301f79e6fe80c8cde18cb084384292/ofl/notoserif/NotoSerif-Bold.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/c698ee1cbe301f79e6fe80c8cde18cb084384292/ofl/notoserif/NotoSerif-BoldItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/c698ee1cbe301f79e6fe80c8cde18cb084384292/ofl/notoserif/NotoSerif-Italic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/c698ee1cbe301f79e6fe80c8cde18cb084384292/ofl/notoserif/NotoSerif-Regular.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/c698ee1cbe301f79e6fe80c8cde18cb084384292/ofl/notoserif/OFL.txt
