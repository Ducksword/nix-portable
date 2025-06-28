{
  inputs = {
    # nixpkgs unstable
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: 
    let
      pkgs = nixpkgs.legacyPackages.${system};
      system = "x86_64-linux";
    in {
      homeConfigurations."zach" = home-manager.lib.homeManagerConfiguration {
        modules = [ ./home-manager/users/zach/home.nix ];
        inherit pkgs;
      };
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };
    };
}
