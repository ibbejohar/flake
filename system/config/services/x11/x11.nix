{ config, pkgs, username, ... }:


{
  imports = 
  [
    ./dwm.nix
    #./awesome.nix

  ];
  services = {
    xserver = {
      enable = true;

      # Keyboard layout
      xkb.layout = "se";
      xkb.variant = "nodeadkeys";

    };
  };
}
