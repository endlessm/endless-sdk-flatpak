# Follows freedesktop-sdk.bst from gnome-sdk.
# <https://gitlab.gnome.org/GNOME/gnome-build-meta/blob/gnome-3-34/elements/freedesktop-sdk.bst>
# <https://gitlab.gnome.org/GNOME/gnome-build-meta/blob/gnome-3-34/junction.refs>

kind: junction

sources:
- kind: git_tag
  # Temporarily use a fork until
  # https://gitlab.com/freedesktop-sdk/freedesktop-sdk/-/merge_requests/2306
  # is accepted and in a branch we can use.
  #url: gitlab_com:freedesktop-sdk/freedesktop-sdk.git
  url: https://gitlab.com/dbnicholson/freedesktop-sdk.git
  # Changed to track git commit from upstream bst
  # track: 19.08
  # track-tags: true
  track: 'cfa9b8b795e33e9d8764b3916688be0278ce55ab'
  ref: freedesktop-sdk-19.08.6-1-gcfa9b8b795e33e9d8764b3916688be0278ce55ab

config:
  options:
    target_arch: '%{arch}'
    bootstrap_build_arch: '%{bootstrap_build_arch}'
