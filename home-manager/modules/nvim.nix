{ lib, config, pkgs, ... }:

let
  cfg = config.home.nvim;
in
{
  options = {
    home.nvim.enable = lib.mkEnableOption 
      "Enables home-manager nvim config";
  };

  config = lib.mkIf cfg.enable {
    programs.neovim = 
    let
      toLua = str: "lua << EOF\n${str}\nEOF\n";
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in
    {
      enable = true;

      extraLuaConfig =
      ''
        vim.g.mapleader = ' '
        vim.opt.relativenumber = true
        vim.opt.number = true
        vim.o.signcolumn = 'yes'
        vim.o.tabstop = 2
        vim.o.shiftwidth = 2
        vim.o.expandtab = true
        vim.o.wrap = false
        vim.o.smartcase = true
        vim.o.ignorecase = true
        vim.o.swapfile = false
        vim.o.completeopt = 'menu,menuone,noinsert'
        vim.cmd.colorscheme('sorbet')
      '';

      # plugins = with pkgs.vimPlugins; [
      #   {
      #     plugin = nvim-lspconfig;
      #     config = toLuaFile ./nvim/lsp.lua;
      #   }
      # ];

      extraPackages = with pkgs; [
      # This is where you place all the lsps
      ];

    };
  };
}

