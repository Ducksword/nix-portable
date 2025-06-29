install-btrfs:
	./scripts/install-btrfs.sh	

install-nixos-desktop: install-btrfs
	nixos-generate-config --show-hardware-config --root /mnt > ./hosts/desktop/hardware-configuration.nix
	nixos-install --flake .#desktop

install-hm-zach:
	nix run home-manager/master -- init
	home-manager switch --flake .#zach
