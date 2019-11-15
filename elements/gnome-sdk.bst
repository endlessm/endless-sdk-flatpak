kind: junction

sources:
- kind: git_tag
  url: gitlab_gnome_org:GNOME/gnome-build-meta.git
  track: gnome-3-34
  track-tags: true
  ref: 3.34.1-7-g4b6f662d373970d09ba2c7ed70bc8d791dcf50a4

config:
  options:
    arch: '%{arch}'
