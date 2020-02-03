# Follows freedesktop-sdk.bst from gnome-sdk.
# <https://gitlab.gnome.org/GNOME/gnome-build-meta/blob/gnome-3-34/elements/freedesktop-sdk.bst>
# <https://gitlab.gnome.org/GNOME/gnome-build-meta/blob/gnome-3-34/junction.refs>

kind: junction

sources:
- kind: git_tag
  url: gitlab_com:freedesktop-sdk/freedesktop-sdk.git
  # Changed to track git commit from upstream bst
  # track: 19.08
  # track-tags: true
  track: '3fd3a60ab6fcfffa7c98ced1eb8349963722b491'
  ref: freedesktop-sdk-19.08.4-0-g3fd3a60ab6fcfffa7c98ced1eb8349963722b491

config:
  options:
    target_arch: '%{arch}'
    bootstrap_build_arch: '%{bootstrap_build_arch}'
