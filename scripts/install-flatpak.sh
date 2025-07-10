#! /usr/bin/env bash
flatpak remote-add -u --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

packages=(
    com.adamcake.Bolt
    com.mastermindzh.tidal-hifi
    com.obsproject.Studio
    com.valvesoftware.Steam
    dev.vencord.Vesktop
    net.lutris.Lutris
    one.ablaze.floorp
    org.videolan.VLC
    sh.ppy.osu
    tv.plex.PlexDesktop
)
for pkgs in "${packages[@]}"; do
    flatpak install -u -y "$pkgs"
done

echo "Copying flatpak data"
for pkgs in "${packages[@]}"; do
    rsync -av "/mnt/backup/zach/.var/app/$pkgs" "$HOME/.var/app/"
done