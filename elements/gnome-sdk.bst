kind: junction

sources:
- kind: git_tag
  url: gitlab_gnome_org:GNOME/gnome-build-meta.git
  track: gnome-3-36
  track-tags: true
  ref: 3.36.3-0-g319f2066f3d1b1718aa4af5cc1a85a8cf5cb3b8e

config:
  options:
    arch: '%{arch}'
