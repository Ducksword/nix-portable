{ config, lib, ... }:

let
  cfg = config.home.vim;

in
{
  options = {
    home.vim.enable =
      lib.mkEnableOption
      "Enable Vim home-manager configuration";
  };

  config = lib.mkIf cfg.enable {
    programs.vim = {
      enable = true;
      defaultEditor = true;
      extraConfig = ''
        colorscheme sorbet
        set mouse=a
        set relativenumber
        set number
      ''; 
    };
  };
}