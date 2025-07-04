{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ptyxis
    wget
    just
    lazygit
  ];
}