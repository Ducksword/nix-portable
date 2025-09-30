{ lib, config, pkgs, ... }:

let
  cfg = config.home.vim;

in
{
  options = {
    home.vim.enable = lib.mkEnableOption 
      "enable home-manager vim config";
  };

  config = lib.mkIf cfg.enable {
    programs.vim = {
      enable = true;
      extraConfig = ''
	colorscheme sorbet
        set mouse=a
	set relativenumber
	set number
      '';
    };
  };
}
