# Follows freedesktop-sdk.bst from gnome-sdk.
# <https://gitlab.gnome.org/GNOME/gnome-build-meta/blob/gnome-3-36/elements/freedesktop-sdk.bst>
# <https://gitlab.gnome.org/GNOME/gnome-build-meta/blob/gnome-3-36/junction.refs>

kind: junction

sources:
- kind: git_tag
  # Temporarily use a fork until
  # https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/merge_requests/2306
  # is accepted and in a branch we can use.
  url: github_com:endlessm/freedesktop-sdk.git
  # url: gitlab_com/freedesktop-sdk/freedesktop-sdk.git
  # Changed to track git commit from upstream bst
  track: '19.08'
  track-tags: true
  ref: freedesktop-sdk-19.08.6-0-g9c5136535694ef075913ecf2d09c99a6e638aa65

config:
  options:
    target_arch: '%{arch}'
    bootstrap_build_arch: '%{bootstrap_build_arch}'
