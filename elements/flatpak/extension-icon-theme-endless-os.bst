kind: flatpak_image

build-depends:
- flatpak/extension-icon-theme-endless-os-image.bst

config:
  directory: '%{datadir}/icons/EndlessOS'
  metadata:
    Runtime:
      name: org.freedesktop.Platform.Icontheme.EndlessOS

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform.Icontheme/%{gcc_arch}/1.0
