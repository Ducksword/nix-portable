{ lib, config, ... }:
{
  options.git.enable = lib.mkEnableOption "enable git";

  config = lib.mkIf config.git.enable {
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