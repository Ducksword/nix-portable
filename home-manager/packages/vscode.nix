{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      userSettings = {
        "workbench.editor.showTabs" = "single";
        "editor.minimap.enabled" = false;
        "editor.renderWhitespace" = "all";
        "editor.suggest.selectionMode" = "whenTriggerCharacter";
        "editor.quickSuggestions" = {
          "other" = "off";
        };
        "editor.lineNumbers" = "relative";
        "explorer.compactFolders" = false;
        "git.autofetch" = true;
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
      };
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        christian-kohler.path-intellisense
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        # Language support
        jnoortheen.nix-ide
        nefrob.vscode-just-syntax
        mads-hartmann.bash-ide-vscode
      ];
    };
  };

  home.packages = with pkgs; [
    nixd
    bash-language-server
    shellcheck
  ];
}