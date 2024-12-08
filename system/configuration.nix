{ config, pkgs, username, hostname, ... }:

{
  imports =
    [ 
      ./drive/hardware-configuration.nix
      ./packages.nix

      ./config/boot/boot.nix
      ./config/hardware/hardware.nix
      ./config/locale/locale.nix
      ./config/network/network.nix
      ./config/services/services.nix
      ./config/steam/steam.nix
# DEPRICIATED
#      ./config/sound/sound.nix
      ./config/tty/tty.nix
      ./config/vm/vm.nix
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
    #mutableUsers = false;
  };

  nixpkgs.config.allowUnfree = true;
  time.timeZone = "Europe/Stockholm";
  # TTY language
  console.keyMap = "sv-latin1";

  programs.dconf.enable = true;
  fonts.fontconfig.antialias = true;
  home-manager.backupFileExtension = "hm-backup";


#  programs.steam = {
#  enable = true;
#  remotePlay.openFirewall = false; # Open ports in the firewall for Steam Remote Play
#  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
#  };

}
