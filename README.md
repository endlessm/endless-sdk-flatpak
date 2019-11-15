# Endless SDK and platform runtime for Flatpak-based applications

This repository contains a [BuildStream](https://buildstream.build) project that produces the Platform and SDK Flatpak runtimes for applications on Endless OS.

### Building the runtime

Our Buildstream project is based on [gnome-build-meta](https://gitlab.gnome.org/GNOME/gnome-build-meta) and [freedesktop-sdk](https://gitlab.com/freedesktop-sdk/freedesktop-sdk). It mostly contains the same elements as those projects, but certain elements are replaced with our own modified versions, and several new ones are added. To build flatpak runtimes and extensions, use _bst build_:

    bst build flatpak-runtimes.bst

Next, you can checkout the runtimes to an ostree repository:

    bst checkout -f flatpak-runtimes.bst /path/to/repo/
    ostree summary --repo=/path/to/repo --view

Create flatpak bundles, if desired, using the usual tools:

    flatpak build-bundle --runtime /path/to/repo com.endlessm.apps.Platform.flatpak com.endlessm.apps.Platform 6
    flatpak build-bundle --runtime /path/to/repo com.endlessm.apps.Sdk.flatpak com.endlessm.apps.Sdk 6

Or install packages directly from the repository:

    flatpak remote-add --user --no-gpg-verify endless-sdk-flatpak-repo /path/to/repo/
    flatpak remote-ls --user endless-sdk-flatpak-repo

### Cross-compiling for arm

To compile for arm, you will need an arm or aarch64 host. Next, you can specify the target architecture with _arch_ project option:

    bst -o arch arm build flatpak-runtimes.bst

Note that you must include `-o arch arm` for any _bst_ commands, including _bst checkout_.

    bst -o arch checkout -f flatpak-runtimes.bst /path/to/repo/
    ostree summary --repo=/path/to/repo --view

### Installing Buildstream

If you do not have BuildStream available on your system, you can try installing the newest version using pip:

    pip3 install BuildStream BuildStream-external

BuildStream also has several runtime dependencies which you will need to install. For example, using apt on Debian 10:

    apt install bubblewrap python3-pip libostree-dev lzip libgirepository1.0-dev
