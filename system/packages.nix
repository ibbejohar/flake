{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     lua
     alacritty
     dwmblocks
     firefox
     fuse
     git
     rofi
     neovim
     ntfs3g
     wget
     rust-analyzer
     cargo
     lua-language-server
  ];

  fonts.packages = with pkgs; [
      nerdfonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      sil-padauk
      texlivePackages.quran
  ];

}
