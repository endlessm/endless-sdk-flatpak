kind: flatpak_image

build-depends:
- flatpak/image/platform-image.bst
- freedesktop-sdk.bst:integration/compat-gl-dir.bst

config:
  directory: '%{libdir}'
  exclude:
  - debug

  metadata:
    Runtime:
      name: com.endlessm.apps.Platform.Compat.%{gcc_arch}
    ExtensionOf:
      ref: runtime/com.endlessm.apps.Platform/%{gcc_arch}/%{sdk-branch}

