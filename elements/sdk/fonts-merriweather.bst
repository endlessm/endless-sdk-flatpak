kind: manual

build-depends:
- freedesktop-sdk.bst:bootstrap-import.bst

variables:
  fontsdir: "%{install-root}%{datadir}/fonts"

config:
  install-commands:
  - |
    install -m 0755 -d "%{fontsdir}/merriweather"
    install -p -m 0644 * "%{fontsdir}/merriweather"

sources:
- kind: remote
  url: raw_githubusercontent_com:google/fonts/787dfb1fe38159ee8ca8832d0e1ca12b6e8e8f7f/ofl/merriweather/Merriweather-Black.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/787dfb1fe38159ee8ca8832d0e1ca12b6e8e8f7f/ofl/merriweather/Merriweather-BlackItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/787dfb1fe38159ee8ca8832d0e1ca12b6e8e8f7f/ofl/merriweather/Merriweather-Bold.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/787dfb1fe38159ee8ca8832d0e1ca12b6e8e8f7f/ofl/merriweather/Merriweather-BoldItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/787dfb1fe38159ee8ca8832d0e1ca12b6e8e8f7f/ofl/merriweather/Merriweather-Italic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/787dfb1fe38159ee8ca8832d0e1ca12b6e8e8f7f/ofl/merriweather/Merriweather-Light.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/787dfb1fe38159ee8ca8832d0e1ca12b6e8e8f7f/ofl/merriweather/Merriweather-LightItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/787dfb1fe38159ee8ca8832d0e1ca12b6e8e8f7f/ofl/merriweather/Merriweather-Regular.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/787dfb1fe38159ee8ca8832d0e1ca12b6e8e8f7f/ofl/merriweather/OFL.txt
