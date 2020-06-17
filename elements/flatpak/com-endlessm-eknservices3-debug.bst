kind: flatpak_image

build-depends:
- flatpak/image/eknservices3.bst

config:
  directory: '%{debugdir}'
  metadata:
    Runtime:
      name: com.endlessm.EknServices3.Debug

    ExtensionOf:
      ref: runtime/com.endlessm.EknServices3/%{gcc_arch}/%{ekn-services-branch}

