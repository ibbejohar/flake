{ config, pkgs, inputs, system, ... }:
let
  dwl-custom = inputs.dwl-custom.packages.${system}.dwl;
in
  {
    programs = {
      xwayland.enable = true;
      dwl = {
        enable = true;
        package = dwl-custom;
      };
    };


  }
