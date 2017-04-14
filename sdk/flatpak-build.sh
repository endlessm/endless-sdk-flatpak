#!/bin/bash -e

echo "Fetching ostree"
git clone --recursive https://github.com/ostreedev/ostree /opt/ostree
cd /opt/ostree

echo "Building ostree"
./autogen.sh \
        --prefix /usr \
        --sysconfdir /etc \
        --libdir /usr/lib/x86_64-linux-gnu \
        --libexecdir /usr/bin \
        --localstatedir /var \
        --disable-silent-rules \
        --disable-gtk-doc \
        --disable-man \
        --with-dracut \
        --with-grub2 \
        --with-grub2-mkconfig-path=/usr/sbin/grub-mkconfig \
        --with-systemdsystemunitdir=/lib/systemd/system

make

echo "Installing ostree"
make install


echo "Fetching flatpak"
git clone --recursive https://github.com/flatpak/flatpak /opt/flatpak

echo "Building flatpak"
cd /opt/flatpak
./autogen.sh \
        --prefix /usr \
        --sysconfdir /etc \
        --libdir /usr/lib/x86_64-linux-gnu \
        --libexecdir /usr/bin \
        --localstatedir /var \
        --disable-silent-rules \
        --disable-docbook-docs \
        --disable-gtk-doc \
        --disable-installed-tests \
        --disable-documentation \
        --with-priv-mode=none \
        --with-privileged-group=sudo \
        --with-systemdsystemunitdir=/lib/systemd/system

make

echo "Installing flatpak"
make install


echo "Clean up"
rm -rf /opt/ostree
rm -rf /opt/flatpak
