#! /usr/bin/env bash
DISK="/dev/nvme0n1"
PART1="p1"
PART2="p2"

wipefs -a $DISK

printf "label: gpt\n,550M,U\n,,L\n" | sfdisk $DISK

# Make the filesystems and subvolumes
mkfs.fat -F 32 $DISK$PART1
mkfs.btrfs -f $DISK$PART2
mkdir -p /mnt
mount $DISK$PART2 /mnt
btrfs subvolume create /mnt/root
btrfs subvolume create /mnt/home
btrfs subvolume create /mnt/nix
umount /mnt

# Mount the partitions and subvolumes
mount -o compress=zstd,subvol=root $DISK$PART2 /mnt
mkdir /mnt/{home,nix}
mount -o compress=zstd,subvol=home $DISK$PART2 /mnt/home
mount -o compress=zstd,noatime,subvol=nix $DISK$PART2 /mnt/nix

mkdir /mnt/boot
mount $DISK$PART1 /mnt/boot
