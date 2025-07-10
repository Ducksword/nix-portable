{ pkgs, lib, config, ... }:
{
  options.gui-dev.enable = lib.mkEnableOption "enable gui-dev";

  config = lib.mkIf config.gui-dev.enable {
    home.packages = with pkgs; [
      ptyxis
      wget
      just
      lazygit
      vim
    ];
  };
}