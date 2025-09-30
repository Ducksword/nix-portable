# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "America/Detroit";

  # Desktop
  desktop.gnome.enable = true;

  users.users.zach = {
    isNormalUser = true;
    description = "zach";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
  };

  programs.firefox.enable = true;

  # environment.systemPackages = with pkgs; [
  # ];

  networking.hostName = "craptop"; # Define your hostname.

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # btrfs mount options
  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/nix".options = [ "compress=zstd" "noatime" ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  services.fwupd.enable = true;

  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  system.stateVersion = "25.05"; # Did you read the comment?

}

