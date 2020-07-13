kind: stack

depends:

# new elements:
- sdk/eos-knowledge-lib.bst
- sdk/eos-metrics.bst
- sdk/eos-sdk.bst
- sdk/fonts-firasans.bst
- sdk/fonts-lato.bst
- sdk/fonts-librebaskerville.bst
- sdk/fonts-merriweather.bst
- sdk/fonts-notosans.bst
- sdk/fonts-notoserif.bst
- sdk/fonts-raleway.bst
- sdk/fonts-roboto.bst
- sdk/libdmodel.bst

# replaced elements (see platform-upstream.bst):
- gnome-sdk-sdk/cogl.bst
- gnome-sdk-sdk/gst-plugins-base.bst
- gnome-sdk-sdk/gst-plugins-good.bst
- gnome-sdk-sdk/gtk+-3.bst
- sdk/os-release.bst

- platform-upstream.bst
