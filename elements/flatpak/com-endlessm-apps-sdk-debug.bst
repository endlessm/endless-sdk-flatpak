kind: flatpak_image

build-depends:
- flatpak/image/sdk-image.bst

config:
  directory: '%{debugdir}'
  metadata:
    Runtime:
      name: com.endlessm.apps.Sdk.Debug

    ExtensionOf:
      ref: runtime/com.endlessm.apps.Sdk/%{gcc_arch}/%{sdk-branch}

