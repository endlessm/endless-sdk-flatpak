kind: junction

sources:
- kind: git_tag
  url: gitlab_gnome_org:GNOME/gnome-build-meta.git
  track: gnome-3-36
  track-tags: true
  ref: 3.36.2-0-g94451e23d5342298f8ab6a4797c8c8c303679063

config:
  options:
    arch: '%{arch}'
