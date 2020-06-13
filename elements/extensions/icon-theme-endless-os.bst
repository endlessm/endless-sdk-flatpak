kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- gnome-sdk-sdk/gtk+-3.bst
- gnome-sdk.bst:core-deps/intltool.bst
- gnome-sdk.bst:sdk/appstream-glib.bst
- gnome-sdk.bst:sdk/glib.bst
- gnome-sdk.bst:sdk/librsvg.bst

variables:
  extension-dir: '%{datadir}/icons/EndlessOS'
  conf-local: |
    --enable-app-icons \
    --disable-fonts \
    --disable-settings \
    --disable-faces

config:
  install-commands:
    (>):
    - |
      cd bst-local
      mkdir -p "%{install-root}%{extension-dir}/share/appdata"
      install org.freedesktop.Platform.Icontheme.EndlessOS.appdata.xml "%{install-root}%{extension-dir}/share/appdata"
      appstream-compose --basename=org.freedesktop.Platform.Icontheme.EndlessOS --prefix=%{install-root}%{extension-dir} --origin=flatpak org.freedesktop.Platform.Icontheme.EndlessOS

sources:
- kind: git_tag
  url: github_com:endlessm/eos-theme.git
  track: master
  track-tags: true
  ref: Release_3.8.3-0-gcebd71befe3c62203e32dc7a4679bddeb84710f1
- kind: local
  path: files/icon-theme-endless-os
  directory: bst-local
