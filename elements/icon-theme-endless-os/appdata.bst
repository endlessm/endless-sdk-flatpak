kind: manual

build-depends:
- freedesktop-sdk.bst:bootstrap-import.bst
- freedesktop-sdk.bst:components/m4.bst
- gnome-sdk.bst:sdk/appstream-glib.bst

variables:
  extension-dir: '%{datadir}/icons/EndlessOS'

config:
  install-commands:
  - |
    mkdir -p "%{install-root}%{extension-dir}/share/appdata"
    install org.freedesktop.Platform.Icontheme.EndlessOS.appdata.xml "%{install-root}%{extension-dir}/share/appdata"
    appstream-compose --basename=org.freedesktop.Platform.Icontheme.EndlessOS --prefix=%{install-root}%{extension-dir} --origin=flatpak org.freedesktop.Platform.Icontheme.EndlessOS

sources:
- kind: local
  path: files/icon-theme-endless-os-appdata
