#!/usr/bin/env bash
set -euo pipefail

SENTINEL="$HOME/.local/state/spinosauros-configurekeybindings.done"

if [[ -f "$SENTINEL" ]]; then
    exit 0
fi

mkdir -p "$(dirname "$SENTINEL")"

touch "$SENTINEL"

dconf load /org/gnome/settings-daemon/plugins/media-keys/ < /usr/share/ublue-os-spinosauros/dconf/media-keys.dconf
dconf load /org/gnome/desktop/wm/keybindings/ < /usr/share/ublue-os-spinosauros/dconf/wm-keybindings.dconf
dconf load /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ < /usr/share/ublue-os-spinosauros/dconf/custom-keybindings.conf

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "[
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom11/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom12/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom13/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom14/',
'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom15/'
]"
