kind: flatpak_image

build-depends:
- flatpak/image/sdk-image.bst

config:
  directory: '%{libdir}'
  exclude:
  - debug

  metadata:
    Runtime:
      name: com.endlessm.apps.Sdk.Compat.%{gcc_arch}
    ExtensionOf:
      ref: runtime/com.endlessm.apps.Sdk/%{gcc_arch}/%{sdk-branch}
