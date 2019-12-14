kind: junction

sources:
- kind: git_tag
  url: gitlab_gnome_org:GNOME/gnome-build-meta.git
  track: gnome-3-34
  track-tags: true
  ref: 3.34.2-0-g555d24dee94e91d9b6cd8171e77b809204335a1f

config:
  options:
    arch: '%{arch}'
