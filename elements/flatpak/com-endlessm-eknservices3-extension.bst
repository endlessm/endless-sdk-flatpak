kind: flatpak_image

build-depends:
- apps/eos-knowledge-services-3.bst

config:
  directory: '%{prefix}'
  metadata:
    Runtime:
      name: com.endlessm.EknServices3.Extension

    ExtensionOf:
      ref: app/com.endlessm.EknServices3/%{gcc_arch}/%{ekn-services-branch}
