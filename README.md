# Endless SDK and platform runtime for Flatpak-based applications

This repository contains a [BuildStream](https://buildstream.build) project that produces the Platform and SDK Flatpak runtimes for applications on Endless OS.

## Compiling

The easiest way to compile this project is with the included Makefile. You may need to install BuildStream, which is explained later in this section.

To build and install for your host system:

    make

Compiles the BuildStream project, using saved artifacts where possible. This fetches many gigabytes of data over the Internet and may take several hours. The resulting flatpak runtimes and extensions are exported to separate ostree repos in _cache_, and then pulled into the ostree repo at _repo_:

    flatpak remote-add --user --no-gpg-verify endless-sdk-flatpak-repo repo
    flatpak remote-ls --user endless-sdk-flatpak-repo --all

You can export to an existing repo by setting the REPO variable:

    make REPO=/path/to/repo

In addition, you can use the ARCH variable to build for a different architecture:

    make ARCH=arm

Our Makefile includes some other targets which may be useful.

 * `make check`: Check that the BuildStream project is valid
 * `make update-refs`: Update references to the newest versions.
 * `make bundle`: Create a set of Flatpak bundle files in _out_.

### Installing BuildStream

If you do not have BuildStream available on your system, you can try installing the newest version using pip:

    pip3 install --user BuildStream BuildStream-external

BuildStream also has several runtime dependencies which you will need to install. For example, using apt on Debian 10:

    apt install bubblewrap python3-pip libostree-dev lzip libgirepository1.0-dev

On Endless OS you'll need to install some dependencies and unlock the ostree first as well:

    sudo ostree admin unlock  # add --hotfix if desired
    sudo apt install python3-dev minilzip gir1.2-ostree-1.0

Endless OS has a 3.x version of FUSE, incompatible with the latest stable version of BuildStream which expects 2.x. Luckily, it's easy to fix. After you have installed BuildStream (make sure it is installed with `--user`), edit `~/.local/lib/python3.7/site-packages/buildstream/_fuse/mount.py` and remove `, nonempty=True` from line 187.

### Using BuildStream

The Makefile is mostly intended for our CI system, so for some tasks you will have a better experience using BuildStream directly.

#### Building the runtime

To build flatpak runtimes, use _bst build_:

    bst build flatpak-runtimes.bst

Next, you can checkout the runtimes to an ostree repository:

    bst checkout -f flatpak-runtimes.bst /path/to/repo/
    ostree summary --repo=/path/to/repo --view

#### Cross-compiling for arm

To compile for arm, you will need an arm or aarch64 host. Next, you can specify the target architecture with _arch_ project option:

    bst -o arch arm build flatpak-runtimes.bst

Note that you must include `-o arch arm` for any _bst_ commands, including _bst checkout_.

    bst -o arch arm checkout -f flatpak-runtimes.bst /path/to/repo/
    ostree summary --repo=/path/to/repo --view

## Other development information

### Making a release

This project uses reproducible builds, which means any commit in the endless-sdk-flatpak repository should always produce the same build output regardless of when it is built. To release a change in the Endless SDK, including changes in separate repositories such as [eos-knowledge-lib](https://github.com/endlessm/eos-knowledge-lib/) or [libdmodel](https://github.com/endlessm/libdmodel), you must create a new release of endless-sdk-flatpak.

First, use `bst track` to update the references for included code, telling buildstream to use the newest commit from the tracked git branches. For example, if you wish to include a change to eos-knowledge-lib, you can use `bst track sdk/eos-knowledge-lib`. For convenience, you can use `make update-refs` to update the references for all of the elements in this project.

Once you have a release to test, create a new branch and make a pull request. After the pull request is merged to the sdk-6 branch, the CI system will create a development build of the new release and push it to the staging Flatpak repository. Before releasing to production, create an annotated git tag in the sdk-6 branch:

    git tag -a v6.0 -m "Releasing version v6.0"

Next, run the [release-sdk](https://ci.endlessm-sf.com/view/Release/job/release-sdk/) Jenkins job to promote the most recent build to the production Flatpak repository.

### Tracking upstream runtimes

This project includes customized versions of elements included in the upstream [gnome-build-meta](https://gitlab.gnome.org/GNOME/gnome-build-meta) and [freedesktop-sdk](https://gitlab.com/freedesktop-sdk/freedesktop-sdk) BuildStream projects.

Our project is mostly a superset of those projects, using junctions defined in [elements/gnome-sdk.bst](elements/gnome-sdk.bst) and [elements/freedesktop-sdk.bst](elements/freedesktop-sdk.bst). However, certain elements are replaced with our own modified versions. These modified BuildStream files are organized into directories such as [elements/gnome-sdk-sdk](elements/gnome-sdk-sdk) and [elements/freedesktop-sdk-components](elements/freedesktop-sdk-components), as well as [elements/sdk.bst](elements/sdk.bst) and [elements/sdk-platform.bst](elements/sdk-platform.bst). When updating junction files, make sure these elements correspond with their upstream counterparts to avoid conflicts.

### Versioning

As of SDK 6, the Flatpak runtime generated by this project includes a version identifier, which is based on the output of `git describe`. You can find the version for the installed runtime by using `flatpak info`. Tagged releases from the CI system should have versions like "v6.0", while unstable releases will have versions like "v6.0-1-abcdef1" or "v6-devel". You can easily check out the commit corresponding to a release using _git checkout_ followed by the version, such as `git checkout v6.0-1-abcdef1`.

### Testing changes to the SDK

To test your local version of the SDK with an existing Flatpak application, you can use the _run-flatpak-app_ utility:

    ./utils/run-flatpak-app com.endlessm.encyclopedia.en

This will create a BuildStream element for the application, build it, and run it in a sandboxed environment. Note that subsequent runs should be faster. To stop BuildStream from rebuilding other components when you are making a simple change, try running with the _--no-strict_ option:

    ./utils/run-flatpak-app --no-strict com.endlessm.encyclopedia.en

Note that the environment created by run-flatpak-app is slightly different from the one used by Flatpak. Runtime extensions, such as those listed by `flatpak info com.endlessm.apps.Sdk//6 --show-metadata`, are not available, and the sandbox has limited filesystem access. This tool is simply intended for quick testing.
