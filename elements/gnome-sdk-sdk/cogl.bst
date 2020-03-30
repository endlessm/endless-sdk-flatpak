kind: stack

(?):
- arch == "arm":
    depends:
    - gnome-sdk-sdk/cogl-endless-arm.bst
- arch != "arm":
    depends:
    - gnome-sdk.bst:sdk/cogl.bst
