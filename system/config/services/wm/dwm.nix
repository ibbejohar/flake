{ config, pkgs, inputs, system, ... }:
let
  dwm-custom = inputs.dwl-custom.packages.${system}.dwl;
in
{
  services.xserver = {
    windowManager.dwm = {
      enable = true;
      package = dwm-custom;
    };
  };
}
