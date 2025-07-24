install-btrfs:
	./scripts/install-btrfs.sh

install-nixos-desktop: install-btrfs
	nixos-generate-config --show-hardware-config --root /mnt > ./hosts/desktop/hardware-configuration.nix
	nixos-install --no-root-password --no-channel-copy --flake .#desktop

install-nixos-surface: install-btrfs
	nixos-generate-config --show-hardware-config --root /mnt > ./hosts/surface/hardware-configuration.nix
	nixos-install --no-root-password --no-channel-copy --flake .#surface

install-user-zach: install-hm-zach install-flatpak

install-hm-zach:
	nix run home-manager/master -- init --switch
	home-manager switch --flake .#zach

install-flatpak:
	./scripts/install-flatpak.sh

update:
	nix flake update
	just desktop-boot
	nixos-rebuild build --no-build-output --flake .#surface
	rm result

gc:
	sudo nix-collect-garbage -d
	nix-collect-garbage -d

desktop-switch:
	sudo nixos-rebuild switch --flake .#desktop

desktop-boot:
	sudo nixos-rebuild boot --flake .#desktop
	just hm-zach

desktop-backup:
	rsync -az /home/zach /mnt/backup --info=progress2 --exclude-from="./backupExcludes" --delete

surface-switch:
	sudo nixos-rebuild switch --flake .#surface

surface-boot:
	sudo nixos-rebuild --build-host zach@192.168.0.192 boot --flake .#surface
#	 just hm-zach

hm-zach:
	home-manager switch --flake .#zach
	flatpak update -yu
