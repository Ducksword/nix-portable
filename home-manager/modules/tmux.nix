{ lib, config, pkgs, ... }:

let
  cfg = config.home.tmux;
in
{
  options = {
    home.tmux.enable = lib.mkEnableOption 
      "enable home-manager tmux";
  };

  config = lib.mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      keyMode = "vi";
      mouse = true;
      terminal = "screen-256color";
      ## TODO fix shell path for home-manager
      # shell = "/home/zach/.nix-profile/bin/zsh";
    };
  };
}

