{ lib, config, pkgs, ... }:
{
  options.gnome.enable = lib.mkEnableOption "enable gnome";

  config = lib.mkIf config.gnome.enable {
   # imports = [
   #   ./core.nix
   # ];

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
      gnome-contacts
      gnome-text-editor
      gnome-maps
      gnome-music
      gnome-weather
      simple-scan
      totem
    ];

    # Fonts
    fonts.packages = with pkgs; [
      nerd-fonts.ubuntu-mono
    ];
  };
}
