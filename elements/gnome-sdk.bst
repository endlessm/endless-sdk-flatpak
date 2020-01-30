kind: junction

sources:
- kind: git_tag
  url: gitlab_gnome_org:GNOME/gnome-build-meta.git
  track: gnome-3-34
  track-tags: true
  ref: 3.34.3-0-gc2070fdb5fa339573753acaf9d02fda566dfadab

config:
  options:
    arch: '%{arch}'
