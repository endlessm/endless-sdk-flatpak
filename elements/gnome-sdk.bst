kind: junction

sources:
- kind: git_tag
  url: gitlab_gnome_org:GNOME/gnome-build-meta.git
  track: gnome-3-36
  track-tags: true
  ref: 3.35.92-0-g41c16e31e857d2c24af6b9f5435fa4c86ead8d53

config:
  options:
    arch: '%{arch}'
