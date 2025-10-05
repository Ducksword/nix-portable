{
  inputs = {
    # nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

   #  # nixos-hardware
   #  nixos-hardware = {
   #    url = "github:NixOS/nixos-hardware/master";
   #  };
  };

  outputs = { nixpkgs, home-manager, nixos-hardware, self }: 
    let
      pkgs = nixpkgs.legacyPackages.${system};
      system = "x86_64-linux";
    in {

      # nixos configurations
      ## craptop
      nixosConfigurations.craptop = nixpkgs.lib.nixosSystem {
        modules = [ ./nixos/hosts/craptop/configuration.nix ];
      };

      ## desktop
      # nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      #   modules = [ ./nixos/hosts/desktop/configuration.nix ];
      # };

      ## surface 
      # nixosConfigurations.surface = nixpkgs.lib.nixosSystem {
      #   modules = [
      #     ./nixos/hosts/surface/configuration.nix

      #     # for surface kernel
      #     nixos-hardware.nixosModules.microsoft-surface-common
      #   ];
      # };


      # home configurations
      homeConfigurations."zach" = home-manager.lib.homeManagerConfiguration {
        modules = [ ./home-manager/users/zach/home.nix ];
        inherit pkgs;
      };
    };
}
