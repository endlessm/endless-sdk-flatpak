kind: flatpak_image

build-depends:
- apps/eos-knowledge-services-3.bst

config:
  directory: '%{prefix}'
  exclude:
  - debug
  metadata:
    Application:
      name: com.endlessm.EknServices3
      runtime: com.endlessm.apps.Platform/%{gcc_arch}/%{sdk-branch}
      sdk: com.endlessm.apps.Sdk/%{gcc_arch}/%{sdk-branch}

    Context:
      shared: 'network;'
      sockets: 'session-bus;'
      filesystems: '/var/lib/flatpak:ro;~/.local/share/flatpak:ro;/var/endless-extra/flatpak:ro;'

    Session Bus Policy:
      com.endlessm.EknServices3.SearchProviderV3: own

    Extension com.endlessm.EknServices3.Extension:
      directory: build/eos-knowledge-services/3
      autodelete: 'true'
      no-autodownload: 'true'

    Extension com.endlessm.EknServices3.Debug:
      directory: lib/debug
      autodelete: 'true'
      no-autodownload: 'true'
