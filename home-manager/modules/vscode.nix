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
          "git.enableSmartCommit" = true;
          "git.confirmSync" = false;
          "git.autofetch" = true;

          "workbench.colorTheme" = "Monokai Night";
          "workbench.editor.showTabs" = "single";
          "editor.lineNumbers" = "relative";
          "editor.minimap.enabled" = false;
          "editor.renderWhitespace" = "all";
          "editor.suggest.selectionMode" = "whenTriggerCharacter";
          "editor.quickSuggestions" = {
            "other" = "off";
          };
          "explorer.confirmDelete" = false;
          "explorer.compactFolders" = false;
          "path-intellisense.showHiddenFiles" = true;

          "terminal.integrated.defaultProfile.linux" = "zsh";

          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nixd";
        };
        extensions = with pkgs.vscode-extensions; [
          vscodevim.vim
          vscode-icons-team.vscode-icons
          christian-kohler.path-intellisense
          ms-vscode-remote.remote-ssh
          ms-vscode-remote.remote-ssh-edit
          ms-vscode.remote-explorer
          # Themes
          # fabiospampinato.vscode-monokai-night
          # Language support
          jnoortheen.nix-ide
          mads-hartmann.bash-ide-vscode
          nefrob.vscode-just-syntax
        ];
      };
    };
  };
}
