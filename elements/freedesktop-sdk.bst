kind: junction

sources:
- kind: git_tag
  url: gitlab_com:freedesktop-sdk/freedesktop-sdk.git
  track: '19.08'
  track-tags: true
  ref: freedesktop-sdk-19.08.4-0-g3fd3a60ab6fcfffa7c98ced1eb8349963722b491

config:
  options:
    target_arch: '%{arch}'
