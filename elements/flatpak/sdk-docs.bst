kind: flatpak_image

build-depends:
- flatpak/sdk-image.bst

config:
  directory: '%{datadir}/runtime/docs'
  metadata:
    Runtime:
      name: com.endlessm.apps.Sdk.Docs

    ExtensionOf:
      ref: runtime/com.endlessm.apps.Sdk/%{gcc_arch}/%{branch}
