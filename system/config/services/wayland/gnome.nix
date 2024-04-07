{ config, pkgs ... }:

{
  services.xserver = {
    displayManager.gdm = {

      enable = true;
      wayland = true;
    };


    desktopManager.gnome.enable = true;
  };
}
