kind: junction

sources:
- kind: git_tag
  url: gitlab_gnome_org:GNOME/gnome-build-meta.git
  track: gnome-3-36
  track-tags: false
  ref: 3.36.4-2-g09e4aa932a14d346a3e21b966205a5b00f009112

config:
  options:
    arch: '%{arch}'
