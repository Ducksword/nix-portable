#! /usr/bin/env bash
flatpak remote-add -u --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

packages=(
    one.ablaze.floorp
    dev.vencord.Vesktop
    com.valvesoftware.Steam
    sh.ppy.osu
)
for pkgs in "${packages[@]}"; do
    flatpak install -u -y "$pkgs"
done

echo "Copying flatpak data"
for pkgs in "${packages[@]}"; do
    rsync -av "/mnt/backup/zach/.var/app/$pkgs" "$HOME/.var/app/"
done