kind: manual

build-depends:
- freedesktop-sdk.bst:bootstrap-import.bst
- freedesktop-sdk.bst:components/m4.bst
- gnome-sdk.bst:sdk/appstream-glib.bst

config:
  build-commands:
  - |
    for i in *.in; do
      m4 -D__SDK_BRANCH__=%{branch} "${i}" >"$(basename "${i}" .in)"
    done

  install-commands:
  - |
    mkdir -p "%{install-root}%{indep-libdir}"
    install os-release "%{install-root}%{indep-libdir}"
    mkdir -p "%{install-root}%{sysconfdir}"
    ln -s "$(realpath --relative-to="%{install-root}%{sysconfdir}" "%{install-root}%{indep-libdir}/os-release")" %{install-root}%{sysconfdir}/os-release

    mkdir -p "%{install-root}%{sysconfdir}"
    install issue "%{install-root}%{sysconfdir}"
    install issue.net "%{install-root}%{sysconfdir}"

    mkdir -p "%{install-root}%{datadir}/appdata"
    install com.endlessm.apps.Platform.appdata.xml "%{install-root}%{datadir}/appdata"
    install com.endlessm.apps.Sdk.appdata.xml "%{install-root}%{datadir}/appdata"

    appstream-compose --basename=com.endlessm.apps.Platform --prefix=%{install-root}%{prefix} --origin=flatpak com.endlessm.apps.Platform
    appstream-compose --basename=com.endlessm.apps.Sdk --prefix=%{install-root}%{prefix} --origin=flatpak com.endlessm.apps.Sdk

sources:
- kind: local
  path: files/os-release
