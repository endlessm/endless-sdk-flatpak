kind: script

build-depends:
- apps/eknservices3/eos-knowledge-services-3.bst
- freedesktop-sdk.bst:bootstrap-import.bst

variables:
  extension-dir: '%{prefix}/build/eos-knowledge-services/3'

config:
  layout:
  - element: apps/eknservices3/eos-knowledge-services-3.bst
    destination: '%{build-root}/eos-knowledge-services-3.bst'
  - element: bootstrap-import.bst
    destination: /

  commands:
  - install -m 0755 -d %{install-root}/%{extension-dir}
  - cp -R %{build-root}/eos-knowledge-services-3.bst/%{prefix}/* %{install-root}/%{extension-dir}/
