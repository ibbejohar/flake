{ config, pkgs, inputs, system, ... }:
let
  dwm-custom = inputs.dwm-custom.packages.${system}.dwm;
in
{
  services.xserver = {
    windowManager.dwm = {
      enable = true;
      package = dwm-custom;
    };
  };
}
