default:
	just --choose

hms:
	home-manager switch --flake .#zach

update:
	nix flake update
	just boot
	just hms

switch:
	sudo nixos-rebuild switch --flake .
boot:
	sudo nixos-rebuild boot --flake .
gc:
	sudo nix-collect-garbage -d
	nix-collect-garbage -d

install-nixos-desktop: 
	nixos-generate-config --show-hardware-config --root /mnt > ./hosts/desktop/hardware-configuration.nix
	nixos-install --no-root-password --no-channel-copy --flake .#desktop

install-hm-zach:
	nix run home-manager/master -- init --switch
	home-manager switch --flake .#zach

desktop-backup:
	rsync -az /home/zach /mnt/backup --info=progress2 --exclude-from="./backupExcludes" --delete
