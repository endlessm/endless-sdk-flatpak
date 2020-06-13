kind: flatpak_image

build-depends:
- extensions/icon-theme-endless-os.bst

config:
  directory: '%{datadir}/icons/EndlessOS'
  metadata:
    Runtime:
      name: org.freedesktop.Platform.Icontheme.EndlessOS

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform.Icontheme/%{gcc_arch}/1.0
