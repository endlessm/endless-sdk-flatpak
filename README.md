# Endless SDK and platform run times for Flatpak-based applications

This repository contains the manifest and eventual patches necessary to
build the Endless SDK and platform run times to be used by applications
distributed through Flatpak that target the Endless platform.

The Endless run times are based on the GNOME run times, with additional
modules for the Endless platform.

### Building the run times

In order to build the run times, you will need `flatpak-builder` and the
following run times:

 * org.freedesktop.Sdk
 * org.freedesktop.Platform
 * org.gnome.Sdk
 * org.gnome.Platform

Run:

```
    $ make
```

To build the Endless run time.
