kind: flatpak_image

build-depends:
- flatpak/platform-image.bst

config:
  directory: '%{debugdir}%{libdir}'
  include:
  - debug

  metadata:
    Runtime:
      name: com.endlessm.apps.Platform.Compat.%{gcc_arch}.Debug
    ExtensionOf:
      ref: runtime/com.endlessm.apps.Platform/%{gcc_arch}/%{branch}

