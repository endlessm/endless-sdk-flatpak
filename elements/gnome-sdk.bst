kind: junction

sources:
- kind: git_tag
  url: gitlab_gnome_org:GNOME/gnome-build-meta.git
  track: gnome-3-34
  track-tags: true
  ref: 3.34.4-0-ga4c87667d2b96b67cf078f7318e30745b91104f7

config:
  options:
    arch: '%{arch}'
