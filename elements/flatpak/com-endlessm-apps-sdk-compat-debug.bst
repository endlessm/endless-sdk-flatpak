kind: flatpak_image

build-depends:
- flatpak/image/sdk-image.bst

config:
  directory: '%{debugdir}%{libdir}'
  include:
  - debug

  metadata:
    Runtime:
      name: com.endlessm.apps.Sdk.Compat.%{gcc_arch}.Debug
    ExtensionOf:
      ref: runtime/com.endlessm.apps.Sdk/%{gcc_arch}/%{sdk-branch}
