{ config, pkgs, inputs, system, ... }:
let
  st-custom = inputs.st-custom.packages.${system}.st;
in
{
  environment.systemPackages = with pkgs; [
    neovim
    git
    wget
    eza
   #dwlb
   wineWow64Packages.staging
   winetricks
    keyd
    gcc
   #inputs.norgolith.packages.${pkgs.system}.default
   #dwmblocks
   st-custom
  ];

  programs.steam = {
    enable = true;
  };
}
