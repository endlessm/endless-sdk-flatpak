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

sources:
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/raleway/OFL.txt
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/raleway/Raleway-Black.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/raleway/Raleway-BlackItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/raleway/Raleway-Bold.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/raleway/Raleway-BoldItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/raleway/Raleway-ExtraBold.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/raleway/Raleway-ExtraBoldItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/raleway/Raleway-ExtraLight.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/raleway/Raleway-ExtraLightItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/raleway/Raleway-Italic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/raleway/Raleway-Light.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/raleway/Raleway-LightItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/raleway/Raleway-Medium.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/raleway/Raleway-MediumItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/raleway/Raleway-Regular.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/raleway/Raleway-SemiBold.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/raleway/Raleway-SemiBoldItalic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/raleway/Raleway-Thin.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/raleway/Raleway-ThinItalic.ttf
