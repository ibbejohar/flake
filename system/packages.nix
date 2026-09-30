{ config, pkgs, inputs, system, ... }:
let
  st-custom = inputs.st-custom.packages.${system}.st;
  motivewave = pkgs.callPackage ./motivewave.nix { src = inputs.motivewave-deb; };
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
   distrobox
   wireshark-qt
   motivewave
  ];

  programs.steam = {
    enable = true;
  };
  programs.wireshark.enable = true;
}
