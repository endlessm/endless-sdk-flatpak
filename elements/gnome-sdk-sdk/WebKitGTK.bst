kind: stack

(?):
- arch == "arm":
    depends:
    - gnome-sdk-sdk/WebKitGTK-endless-arm.bst
- arch != "arm":
    depends:
    - gnome-sdk.bst:sdk/WebKitGTK.bst
