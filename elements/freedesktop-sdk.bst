kind: junction

sources:
- kind: git_tag
  url: gitlab_com:freedesktop-sdk/freedesktop-sdk.git
  track: 19.08
  track-tags: true

config:
  options:
    target_arch: '%{arch}'
