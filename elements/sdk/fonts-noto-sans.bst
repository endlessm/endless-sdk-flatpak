kind: manual

build-depends:
- freedesktop-sdk.bst:bootstrap-import.bst

variables:
  fontsdir: "%{install-root}%{datadir}/fonts"

config:
  install-commands:
  - |
    install -m 0755 -d "%{fontsdir}/notosans"
    install -p -m 0644 * "%{fontsdir}/notosans"

sources:
- kind: remote
  url: raw_githubusercontent_com:google/fonts/c698ee1cbe301f79e6fe80c8cde18cb084384292/ofl/notosans/NotoSans-Bold.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/c698ee1cbe301f79e6fe80c8cde18cb084384292/ofl/notosans/NotoSans-BoldItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/c698ee1cbe301f79e6fe80c8cde18cb084384292/ofl/notosans/NotoSans-Italic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/c698ee1cbe301f79e6fe80c8cde18cb084384292/ofl/notosans/NotoSans-Regular.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/c698ee1cbe301f79e6fe80c8cde18cb084384292/ofl/notosans/OFL.txt
