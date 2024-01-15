{ config, pkgs, username, hostname, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./services.nix
      ./locale.nix
      ./network.nix
      ./boot.nix
      ./sound.nix
      ./packages.nix
    ];

  # DO NOT CHANGE
  system.stateVersion = "23.11";

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.${username} = {
    isNormalUser = true;
    description = "fool";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
    ];
  };

  nixpkgs.config.allowUnfree = true;
  time.timeZone = "Europe/Stockholm";
  # TTY language
  console.keyMap = "sv-latin1";
}
