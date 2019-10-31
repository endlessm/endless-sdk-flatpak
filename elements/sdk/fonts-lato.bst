kind: manual

build-depends:
- freedesktop-sdk.bst:bootstrap-import.bst

variables:
  fontsdir: "%{install-root}%{datadir}/fonts"

config:
  install-commands:
  - |
    install -m 0755 -d "%{fontsdir}/lato"
    install -p -m 0644 * "%{fontsdir}/lato"

sources:
- kind: remote
  url: raw_githubusercontent_com:google/fonts/a83d078ea5844050baa4372b5697862503b6a5d1/ofl/lato/Lato-Black.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/a83d078ea5844050baa4372b5697862503b6a5d1/ofl/lato/Lato-BlackItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/a83d078ea5844050baa4372b5697862503b6a5d1/ofl/lato/Lato-Bold.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/a83d078ea5844050baa4372b5697862503b6a5d1/ofl/lato/Lato-BoldItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/a83d078ea5844050baa4372b5697862503b6a5d1/ofl/lato/Lato-ExtraBold.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/a83d078ea5844050baa4372b5697862503b6a5d1/ofl/lato/Lato-ExtraBoldItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/a83d078ea5844050baa4372b5697862503b6a5d1/ofl/lato/Lato-ExtraLight.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/a83d078ea5844050baa4372b5697862503b6a5d1/ofl/lato/Lato-ExtraLightItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/a83d078ea5844050baa4372b5697862503b6a5d1/ofl/lato/Lato-Italic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/a83d078ea5844050baa4372b5697862503b6a5d1/ofl/lato/Lato-Light.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/a83d078ea5844050baa4372b5697862503b6a5d1/ofl/lato/Lato-LightItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/a83d078ea5844050baa4372b5697862503b6a5d1/ofl/lato/Lato-Medium.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/a83d078ea5844050baa4372b5697862503b6a5d1/ofl/lato/Lato-MediumItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/a83d078ea5844050baa4372b5697862503b6a5d1/ofl/lato/Lato-Regular.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/a83d078ea5844050baa4372b5697862503b6a5d1/ofl/lato/Lato-SemiBold.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/a83d078ea5844050baa4372b5697862503b6a5d1/ofl/lato/Lato-SemiBoldItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/a83d078ea5844050baa4372b5697862503b6a5d1/ofl/lato/Lato-Thin.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/a83d078ea5844050baa4372b5697862503b6a5d1/ofl/lato/Lato-ThinItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/a83d078ea5844050baa4372b5697862503b6a5d1/ofl/lato/OFL.txt
