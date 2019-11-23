kind: junction

sources:
- kind: git_tag
  url: gitlab_gnome_org:GNOME/gnome-build-meta.git
  track: gnome-3-34
  track-tags: false
  ref: 3.34.1-10-g60baa59dd2995792b8a1293c6c09fe81f4109cdd

config:
  options:
    arch: '%{arch}'
