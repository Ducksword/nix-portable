{ lib, config, pkgs, ... }:
let
  cfg = config.desktop.gnome;

in
{
  options = {
    desktop.gnome.enable = lib.mkEnableOption 
      "enable gnome";
  };

  config = lib.mkIf cfg.enable {

    # Enables gnome desktop
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    # Gnome extensions and packages
    environment.systemPackages = with pkgs; [
      # Extensions
      gnomeExtensions.blur-my-shell
      gnomeExtensions.dash-to-dock
      gnomeExtensions.caffeine 
      gnomeExtensions.vitals

      # Packages
      gnome-tweaks
    ];

    # Package Excludes
    environment.gnome.excludePackages = with pkgs; [
      decibels
      epiphany
      geary
      gnome-calendar
      gnome-connections
      gnome-contacts
      gnome-maps
      gnome-music
      gnome-text-editor
      gnome-tour
      gnome-weather
      simple-scan
      snapshot
      totem
    ];

    # Fonts
    fonts.packages = with pkgs; [
      nerd-fonts.ubuntu-sans
      nerd-fonts.ubuntu-mono
    ];
  };
}
