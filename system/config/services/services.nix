{ config, pkgs, username, ... }:

{
  imports = 
  [
   #./x11/x11.nix
   ./wayland/hyprland.nix
  ];

  services = {
    printing.enable = true;
    # openssh.enable = true;
  };
}
