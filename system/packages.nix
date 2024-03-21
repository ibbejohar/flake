{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     alacritty
     dwmblocks
     firefox
     fuse
     git
     rofi
     neovim
     ntfs3g
     wget
  ];

  fonts.packages = with pkgs; [
      nerdfonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      sil-padauk
  ];

}
