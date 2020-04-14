kind: junction

sources:
- kind: git_tag
  url: gitlab_gnome_org:GNOME/gnome-build-meta.git
  track: gnome-3-36
  track-tags: true
  ref: 3.36.1-0-g22064f1bb20d029935b101e0301feb76b12f3a09

config:
  options:
    arch: '%{arch}'
