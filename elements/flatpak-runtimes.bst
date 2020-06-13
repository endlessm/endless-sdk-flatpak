kind: flatpak_repo

build-depends:
- freedesktop-sdk.bst:deploy-tools/flatpak.bst

(?):
# platform and sdk should not be built on i686
- arch != 'i686':
    build-depends:
      (>):
      - flatpak/com-endlessm-apps-platform.bst
      - flatpak/com-endlessm-apps-platform-locale.bst
      - flatpak/com-endlessm-apps-sdk.bst
      - flatpak/com-endlessm-apps-sdk-debug.bst
      - flatpak/com-endlessm-apps-sdk-docs.bst
      - flatpak/com-endlessm-apps-sdk-locale.bst

# platform compat is only built on 32 bit
- arch in ('i686', 'arm'):
    build-depends:
      (>):
      - flatpak/com-endlessm-apps-platform-compat.bst
      - flatpak/com-endlessm-apps-platform-compat-debug.bst

# sdk compat is not built on x86_64
- arch != 'x86_64':
    build-depends:
      (>):
      - flatpak/com-endlessm-apps-sdk-compat.bst
      - flatpak/com-endlessm-apps-sdk-compat-debug.bst

config:
  environment:
  - deploy-tools/flatpak.bst
  arch: '%{gcc_arch}'
  branch: '%{sdk-branch}'
  repo-mode: bare-user-only
  (?):
  - arch == 'i686':
      copy-refs:
      - src: runtime/com.endlessm.apps.Platform.Compat.%{gcc_arch}/%{gcc_arch}/%{sdk-branch}
        dest: runtime/com.endlessm.apps.Platform.Compat.%{gcc_arch}/x86_64/%{sdk-branch}
      - src: runtime/com.endlessm.apps.Platform.Compat.%{gcc_arch}.Debug/%{gcc_arch}/%{sdk-branch}
        dest: runtime/com.endlessm.apps.Platform.Compat.%{gcc_arch}.Debug/x86_64/%{sdk-branch}
      - src: runtime/com.endlessm.apps.Sdk.Compat.%{gcc_arch}/%{gcc_arch}/%{sdk-branch}
        dest: runtime/com.endlessm.apps.Sdk.Compat.%{gcc_arch}/x86_64/%{sdk-branch}
      - src: runtime/com.endlessm.apps.Sdk.Compat.%{gcc_arch}.Debug/%{gcc_arch}/%{sdk-branch}
        dest: runtime/com.endlessm.apps.Sdk.Compat.%{gcc_arch}.Debug/x86_64/%{sdk-branch}

  - arch == 'arm':
      copy-refs:
      - src: runtime/com.endlessm.apps.Platform.Compat.%{gcc_arch}/%{gcc_arch}/%{sdk-branch}
        dest: runtime/com.endlessm.apps.Platform.Compat.%{gcc_arch}/aarch64/%{sdk-branch}
      - src: runtime/com.endlessm.apps.Platform.Compat.%{gcc_arch}.Debug/%{gcc_arch}/%{sdk-branch}
        dest: runtime/com.endlessm.apps.Platform.Compat.%{gcc_arch}.Debug/aarch64/%{sdk-branch}
      - src: runtime/com.endlessm.apps.Sdk.Compat.%{gcc_arch}/%{gcc_arch}/%{sdk-branch}
        dest: runtime/com.endlessm.apps.Sdk.Compat.%{gcc_arch}/x86_64/%{sdk-branch}
      - src: runtime/com.endlessm.apps.Sdk.Compat.%{gcc_arch}.Debug/%{gcc_arch}/%{sdk-branch}
        dest: runtime/com.endlessm.apps.Sdk.Compat.%{gcc_arch}.Debug/x86_64/%{sdk-branch}

  - arch == 'aarch64':
      copy-refs:
      - src: runtime/com.endlessm.apps.Sdk.Compat.%{gcc_arch}/%{gcc_arch}/%{sdk-branch}
        dest: runtime/com.endlessm.apps.Sdk.Compat.%{gcc_arch}/x86_64/%{sdk-branch}
      - src: runtime/com.endlessm.apps.Sdk.Compat.%{gcc_arch}.Debug/%{gcc_arch}/%{sdk-branch}
        dest: runtime/com.endlessm.apps.Sdk.Compat.%{gcc_arch}.Debug/x86_64/%{sdk-branch}
