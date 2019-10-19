# Endless SDK and platform runtime for Flatpak-based applications

This repository contains a [BuildStream](https://buildstream.build) project that produces the Platform and SDK Flatpak runtimes for applications on Endless OS.

### Building the runtime

Our Buildstream project is based on [gnome-build-meta](https://gitlab.gnome.org/GNOME/gnome-build-meta) and [freedesktop-sdk](https://gitlab.com/freedesktop-sdk/freedesktop-sdk). It mostly contains the same elements as those projects, but certain elements are replaced with our own modified versions, and several new ones are added. To build flatpak runtimes and extensions, use _bst build_:

    bst track flatpak-runtimes.bst --track-all --track-cross-junctions
    bst build flatpak-runtimes.bst

Afterwards, you can checkout the runtimes to an ostree repository:

    bst checkout -f flatpak-runtimes.bst /path/to/repo/
    flatpak remote-add --user --no-gpg-verify endless-sdk-flatpak-repo /path/to/repo/
    flatpak remote-ls --user endless-sdk-flatpak-repo

# Default theme fonts

TODO: The runtime should contain fonts from zip files in the fonts subdir. There should be a utility to update these fonts from Google Fonts.
