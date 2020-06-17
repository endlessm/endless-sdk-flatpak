kind: manual

(@): flatpak-version.yml

build-depends:
- freedesktop-sdk.bst:bootstrap-import.bst
- freedesktop-sdk.bst:components/m4.bst
- gnome-sdk.bst:sdk/appstream-glib.bst

config:
  build-commands:
  - |
    for i in *.in; do
      m4 \
        -D__RUNTIME_VERSION_DATE__=%{runtime-version-date} \
        -D__RUNTIME_VERSION__=%{runtime-version} \
        "${i}" >"$(basename "${i}" .in)"
    done

  install-commands:
  - |
    mkdir -p "%{install-root}%{datadir}/appdata"
    install com.endlessm.EknServices3.appdata.xml "%{install-root}%{datadir}/appdata"
    appstream-compose --basename=com.endlessm.EknServices3 --prefix=%{install-root}%{prefix} --origin=flatpak com.endlessm.EknServices3

sources:
- kind: local
  path: files/eos-knowledge-services
