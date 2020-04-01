kind: junction

sources:
- kind: git_tag
  url: gitlab_gnome_org:GNOME/gnome-build-meta.git
  track: gnome-3-36
  track-tags: true
  ref: 3.36.0-7-g209e9ad8ca2463a478d9375a00fa27b82bc70b45

config:
  options:
    arch: '%{arch}'
