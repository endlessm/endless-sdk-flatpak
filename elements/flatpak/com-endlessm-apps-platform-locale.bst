kind: flatpak_image

build-depends:
- flatpak/image/platform-image.bst

config:
  directory: '%{datadir}/runtime/locale'
  metadata:
    Runtime:
      name: com.endlessm.apps.Platform.Locale

    ExtensionOf:
      ref: runtime/com.endlessm.apps.Platform/%{gcc_arch}/%{sdk-branch}
