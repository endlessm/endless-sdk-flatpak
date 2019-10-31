kind: junction

sources:
- kind: git_tag
  url: gitlab_com:freedesktop-sdk/freedesktop-sdk.git
  track: '19.08'
  track-tags: true
  ref: freedesktop-sdk-19.08.3-0-g816a8ddf806ff686d3cfbd69463e8b59f6b5720f

config:
  options:
    target_arch: '%{arch}'
