{ lib, config, pkgs, ... }:

let
  cfg = config.home.lsp;
in
{
  options = {
    home.lsp.enable = lib.mkEnableOption 
      "Enables home-manager editor lsps";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      # Language servers
      nixd
      bash-language-server
      shellcheck
    ];
  };
}
