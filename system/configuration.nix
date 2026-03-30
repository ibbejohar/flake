{ config, lib, pkgs, user, host, inputs, system, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./packages.nix
      ./config/boot/boot.nix
      ./config/hardware/hardware.nix
      ./config/network/network.nix
      ./config/services/services.nix
      ./config/tty/tty.nix
      ./config/time/time.nix
      ./config/users/users.nix
      ./config/font/font.nix
      ./config/vm/vm.nix
    ];

    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "25.05";

  }

