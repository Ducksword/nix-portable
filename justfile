install-btrfs:
	./scripts/install-btrfs.sh

install-nixos-desktop: install-btrfs
	nixos-generate-config --show-hardware-config --root /mnt > ./hosts/desktop/hardware-configuration.nix
	nixos-install --flake .#desktop

install-hm-zach:
	nix run home-manager/master -- init --switch
	home-manager switch --flake .#zach

install-flatpak:
	./scripts/install-flatpak.sh

update:
	nix flake update

desktop-switch:
	sudo nixos-rebuild switch --flake .#desktop

desktop-boot: hm-zach
	sudo nixos-rebuild boot --flake .#desktop

desktop-backup:
	rsync -az /home/zach /mnt/backup --info=progress2 --exclude-from="./backupExcludes" --delete

hm-zach:
	home-manager switch --flake .#zach
#	flatpak update -yu
