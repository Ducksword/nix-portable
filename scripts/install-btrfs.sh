#! /usr/bin/env bash
DISK="/dev/sda"

wipefs -a $DISK

printf "label: gpt\n,550M,U\n,,L\n" | sfdisk $DISK

# Make the filesystems and subvolumes
mkfs.fat -F 32 $DISK"1"
mkfs.btrfs -f $DISK"2"
mkdir -p /mnt
mount $DISK"2" /mnt
btrfs subvolume create /mnt/root
btrfs subvolume create /mnt/home
btrfs subvolume create /mnt/nix
umount /mnt

# Mount the partitions and subvolumes
mount -o compress=zstd,subvol=root $DISK"2" /mnt
mkdir /mnt/{home,nix}
mount -o compress=zstd,subvol=home $DISK"2" /mnt/home
mount -o compress=zstd,noatime,subvol=nix $DISK"2" /mnt/nix

mkdir /mnt/boot
mount $DISK"1" /mnt/boot
