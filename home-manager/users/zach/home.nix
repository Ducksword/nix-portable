{ config, pkgs, ... }:

{
  home = {
    git.enable = true;
    lsp.enable = true;
    nvim.enable = true;
    tmux.enable = true;
    vim.enable = true;
    vscode.enable = false;
    zsh.enable = true;
  };

  programs.bat = {
    enable = true;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    profileExtra =
      ''
      export NIX_PATH="$NIX_PATH:nixpkgs=flake:nixpkgs"
      '';
  };

  home.packages = with pkgs;[
    ptyxis
    lazygit
    fzf
    just
    wget

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # #(pkgs.nerdfonts.override { fonts = [ "UbuntuSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    # ".emacs.d".source = ../../.dotfiles/.emacs.d;

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
  imports = [
    ../../modules
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.username = "zach";
  home.homeDirectory = "/home/zach";
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
