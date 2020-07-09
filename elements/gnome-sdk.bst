kind: junction

sources:
- kind: git_tag
  url: gitlab_gnome_org:GNOME/gnome-build-meta.git
  track: gnome-3-36
  track-tags: true
  ref: 3.36.4-0-g9fc228ac2c1ff4c598a3f83a39dca577244ab022

config:
  options:
    arch: '%{arch}'
