{ config, pkgs, username, ... }:

{

  programs.hyprland = {
   enable = true;
   nvidiaPatches = true;
   xwayland.enable = true;

  };
  
  # Optional, hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  hardware.nvidia.modesetting.enable = true;

}
