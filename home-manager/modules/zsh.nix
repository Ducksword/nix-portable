{ lib, config, pkgs, ... }:

let
  cfg = config.home.zsh;
in
{
  options = {
    home.zsh.enable = lib.mkEnableOption 
      "enable home-manager zsh";
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion = {
        enable = true;
        # highlight = "";
      };
      enableVteIntegration = true;
      oh-my-zsh = {
        enable = true;
        theme = "frisk";
      };
      sessionVariables = {};
      shellAliases = {
        ls = "ls -a --color";
        lg = "lazygit";
      };
      syntaxHighlighting = {
        enable = true;
      };
    };
  };
}
