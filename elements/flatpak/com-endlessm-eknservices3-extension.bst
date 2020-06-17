kind: flatpak_image

build-depends:
- flatpak/image/eknservices3-extension.bst

config:
  directory: '%{prefix}/build/eos-knowledge-services/3'
  metadata:
    Runtime:
      name: com.endlessm.EknServices3.Extension

    ExtensionOf:
      ref: app/com.endlessm.EknServices3/%{gcc_arch}/%{ekn-services-branch}
