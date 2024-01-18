{ config, pkgs, username, hostname, ... }:

{
  imports =
    [ 
      ./drive/hardware-configuration.nix

      ./config/services.nix
      ./config/locale.nix
      ./config/network.nix
      ./config/boot.nix
      ./config/sound.nix
      ./config/packages.nix
      ./config/hardware.nix
      ./config/vm.nix
    ];

  # DO NOT CHANGE
  system.stateVersion = "23.11";

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users = {
    users.${username} = {
      isNormalUser = true;
      description = "fool";
      extraGroups = [ "networkmanager" "wheel" "libvirtd" "lp" ];
    };
    mutableUsers = false;
  };

  nixpkgs.config.allowUnfree = true;
  time.timeZone = "Europe/Stockholm";
  # TTY language
  console.keyMap = "sv-latin1";

# Move the overlays to its own module
nixpkgs.overlays = [
(final: prev: {
    dwm = prev.dwm.overrideAttrs (old: { src = /home/fool/.config/suckless/dwm; });
    dwmblocks = prev.dwmblocks.overrideAttrs (old: { src = /home/fool/.config/suckless/blocks; });
  })
];

}
