kind: manual

build-depends:
- freedesktop-sdk.bst:bootstrap-import.bst

variables:
  fontsdir: "%{install-root}%{datadir}/fonts"

config:
  install-commands:
  - |
    install -m 0755 -d "%{fontsdir}/librebaskerville"
    install -p -m 0644 * "%{fontsdir}/librebaskerville"

sources:
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/librebaskerville/LibreBaskerville-Bold.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/librebaskerville/LibreBaskerville-Italic.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/librebaskerville/LibreBaskerville-Regular.ttf
- kind: remote
  url: raw_githubusercontent_com:google/fonts/49fbebd3dc75d42fe72c4a3eef6524f8fcc335fd/ofl/librebaskerville/OFL.txt
