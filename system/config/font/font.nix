{ config, pkgs, ... }:

{
  fonts.packages= with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    sil-padauk
  ];

}
