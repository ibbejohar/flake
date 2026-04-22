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
    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
      libxkbcommon
      xorg.libX11
      xorg.libXcursor
      xorg.libXrandr
      xorg.libXi
      xorg.libXext
      xorg.libxcb
      xcbutilxrm
      libxcb-wm
      libxcb-util
      libxcb-image
      libxcb-keysyms
      libxcb-render-util
      freetype
      fontconfig
      dbus
      qt6.qtcharts
      qt6.qtbase
      qt6.qtlocation
      qt6.qtpositioning
    ];
    system.stateVersion = "25.05";

  }

