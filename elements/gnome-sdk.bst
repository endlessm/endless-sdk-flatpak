kind: junction

sources:
- kind: git_tag
  url: gitlab_gnome_org:GNOME/gnome-build-meta.git
  track: gnome-3-36
  track-tags: true
  ref: 3.36.0-0-g01ad861845c42bffa8449d2b1656bfff6696639c

config:
  options:
    arch: '%{arch}'
