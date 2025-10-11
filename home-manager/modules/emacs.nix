{ lib, config, pkgs ? import <nixpkgs> { }, ... }:

let
  cfg = config.home.emacs;
  myEmacs =
    (pkgs.emacs.override {
      # Use gtk3 instead of the default gtk2
      withGTK3 = true;
      withGTK2 = false;
    }).overrideAttrs(attrs: {});

in
{
  options = {
    home.emacs.enable = lib.mkEnableOption 
      "enable emacs home-manager";
  };

  config = lib.mkIf cfg.enable {
    programs.emacs = {
      enable = true;
    };
  };
}
