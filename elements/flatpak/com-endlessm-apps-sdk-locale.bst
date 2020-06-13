kind: flatpak_image

build-depends:
- flatpak/image/sdk-image.bst

config:
  directory: '%{datadir}/runtime/locale'
  metadata:
    Runtime:
      name: com.endlessm.apps.Sdk.Locale

    ExtensionOf:
      ref: runtime/com.endlessm.apps.Sdk/%{gcc_arch}/%{sdk-branch}
