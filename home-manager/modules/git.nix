{ lib, config, pkgs, ... }:

let
  cfg = config.home.git;
in
{
  options = {
    home.git.enable = lib.mkEnableOption 
      "Enables home-manager git config";
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      diff-highlight.enable = true;
      userEmail = "Diabotek@proton.me";
      userName = "ducksword";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
