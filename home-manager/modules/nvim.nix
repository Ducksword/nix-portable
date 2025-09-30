{ lib, config, pkgs, ... }:

let
  cfg = config.home.nvim;
in
{
  options = {
    home.nvim.enable = lib.mkEnableOption 
      "Enables home-manager nvim config";
  };

  config = lib.mkIf cfg.enable {
    programs.neovim.enable = true;
  };
}

