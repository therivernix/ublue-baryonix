#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y firefox firefox-langpacks yelp systemd-devel

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

# Removing built-in extensions
rm -rf /usr/share/gnome-shell/extensions/burn-my-windows@schneegans.github.com
rm -rf /usr/share/gnome-shell/extensions/desktop-cube@schneegans.github.com
rm -rf /usr/share/gnome-shell/extensions/compiz-alike-magic-lamp-effect@hermes83.github.com
rm -rf /usr/share/gnome-shell/extensions/compiz-windows-effect@hermes83.github.com
rm -rf /usr/share/gnome-shell/extensions/logomenu@aryan_k
rm -rf /usr/share/gnome-shell/extensions/restartto@tiagoporsch.github.io

# Compile GSettings schemas for GNOME extensions
find /usr/share/gnome-shell/extensions -type d -name schemas \
    -exec glib-compile-schemas {} \;

#### Example for enabling a System Unit File

systemctl enable podman.socket
