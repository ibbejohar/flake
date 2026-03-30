{ config, pkgs, ... }:

{

  programs.river = {
    enable = true;
    xwayland.enable = true;
    extraPackages = with pkgs; [
      rofi
      swaybg
      wideriver
    ];
  };
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.override { withRiver = true; };
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
