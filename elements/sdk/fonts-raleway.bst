kind: manual

build-depends:
- freedesktop-sdk.bst:bootstrap-import.bst

variables:
  fontsdir: "%{install-root}%{datadir}/fonts"

config:
  install-commands:
  - |
    install -m 0755 -d "%{fontsdir}/raleway"
    install -p -m 0644 * "%{fontsdir}/raleway"

# File listing generated by hand from
# https://api.github.com/repos/google/fonts/contents/ofl/raleway

sources:
- kind: remote
  url: raw_githubusercontent_com:google/fonts/3fcf54a1009c15ca73c01a72a56c821cad413289/ofl/raleway/OFL.txt
- kind: remote
  url: raw_githubusercontent_com:google/fonts/3fcf54a1009c15ca73c01a72a56c821cad413289/ofl/raleway/Raleway-Black.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/3fcf54a1009c15ca73c01a72a56c821cad413289/ofl/raleway/Raleway-BlackItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/3fcf54a1009c15ca73c01a72a56c821cad413289/ofl/raleway/Raleway-Bold.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/3fcf54a1009c15ca73c01a72a56c821cad413289/ofl/raleway/Raleway-BoldItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/3fcf54a1009c15ca73c01a72a56c821cad413289/ofl/raleway/Raleway-ExtraBold.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/3fcf54a1009c15ca73c01a72a56c821cad413289/ofl/raleway/Raleway-ExtraBoldItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/3fcf54a1009c15ca73c01a72a56c821cad413289/ofl/raleway/Raleway-ExtraLight.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/3fcf54a1009c15ca73c01a72a56c821cad413289/ofl/raleway/Raleway-ExtraLightItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/3fcf54a1009c15ca73c01a72a56c821cad413289/ofl/raleway/Raleway-Italic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/3fcf54a1009c15ca73c01a72a56c821cad413289/ofl/raleway/Raleway-Light.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/3fcf54a1009c15ca73c01a72a56c821cad413289/ofl/raleway/Raleway-LightItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/3fcf54a1009c15ca73c01a72a56c821cad413289/ofl/raleway/Raleway-Medium.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/3fcf54a1009c15ca73c01a72a56c821cad413289/ofl/raleway/Raleway-MediumItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/3fcf54a1009c15ca73c01a72a56c821cad413289/ofl/raleway/Raleway-Regular.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/3fcf54a1009c15ca73c01a72a56c821cad413289/ofl/raleway/Raleway-SemiBold.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/3fcf54a1009c15ca73c01a72a56c821cad413289/ofl/raleway/Raleway-SemiBoldItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/3fcf54a1009c15ca73c01a72a56c821cad413289/ofl/raleway/Raleway-Thin.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/3fcf54a1009c15ca73c01a72a56c821cad413289/ofl/raleway/Raleway-ThinItalic.ttf
