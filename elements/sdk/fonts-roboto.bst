kind: manual

build-depends:
- freedesktop-sdk.bst:bootstrap-import.bst

variables:
  fontsdir: "%{install-root}%{datadir}/fonts"

config:
  install-commands:
  - |
    install -m 0755 -d "%{fontsdir}/roboto"
    install -p -m 0644 * "%{fontsdir}/roboto"

sources:
- kind: remote
  url: raw_githubusercontent_com:google/fonts/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/LICENSE.txt
- kind: remote
  url: raw_githubusercontent_com:google/fonts/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-Black.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-BlackItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-Bold.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-BoldItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-Italic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-Light.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-LightItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-Medium.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-MediumItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-Regular.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-Thin.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/724bf98e9f5cb98a1d3d5044f45a2e286b817401/apache/roboto/Roboto-ThinItalic.ttf
