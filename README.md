# disko
Use disko-install 
https://github.com/nix-community/disko/blob/master/docs/disko-install.md

disk-name is just a label
```
sudo nix run 'github:nix-community/disko/latest#disko-install' --  --experimental-features 'nix-command flakes' --flake .#desktop --disk main /dev/sda
```

# How to make custom options
```
{ lib, config, ... }:
{
  options.NAME.enable = lib.mkEnableOption "enable NAME";

  config = lib.mkIf config.NAME.enable {

  };
}
```