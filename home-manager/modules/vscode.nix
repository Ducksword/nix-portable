{ pkgs, lib, config, ... }:

let
  cfg = config.home.vscode;

in
{
  options = {
    home.vscode.enable = lib.mkEnableOption 
      "enable home-manager vscode";
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      profiles.default = {
        enableExtensionUpdateCheck = false;
        enableUpdateCheck = false;
        userSettings = {
          "editor.lineNumbers" = "relative";
          "editor.minimap.enabled" = false;
          "editor.renderWhitespace" = "all";
          "editor.suggest.selectionMode" = "whenTriggerCharacter";
          "editor.quickSuggestions" = {
            "other" = "off";
          };
          "explorer.compactFolders" = false;
          "git.autofetch" = true;
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nixd";
          "workbench.editor.showTabs" = "single";
        };
        extensions = with pkgs.vscode-extensions; [
          vscodevim.vim
          christian-kohler.path-intellisense
          ms-vscode-remote.remote-ssh
          ms-vscode-remote.remote-ssh-edit
          # Language support
          jnoortheen.nix-ide
          mads-hartmann.bash-ide-vscode
          nefrob.vscode-just-syntax
        ];
      };
    };

    home.packages = with pkgs; [
      nixd
      bash-language-server
      shellcheck
    ];
  };
}
