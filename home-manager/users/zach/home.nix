{ config, pkgs, ... }:

{
  home.username = "zach";
  home.homeDirectory = "/home/zach";

  programs.git = {
    enable = true;
    diff-highlight.enable = true;
    userEmail = "Diabotek@proton.me";
    userName = "ducksword";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

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
      };
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        christian-kohler.path-intellisense
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        # Language support
        jnoortheen.nix-ide
        nefrob.vscode-just-syntax
      ];
    };
  };
  
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    pkgs.just
    pkgs.lazygit
    pkgs.neovim 
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/zach/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "25.05"; # Please read the comment before changing.
  programs.home-manager.enable = true;
}
