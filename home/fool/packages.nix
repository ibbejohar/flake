{ pkgs, ... }:
{
  # Concatenate the two lists of packages
 # nixpkgs.config.permittedInsecurePackages = [
 #   "dotnet-runtime-7.0.20"
 # ];
  home.packages = with pkgs; [
   #audacity
   bash-language-server
   bibata-cursors
   bitwarden-desktop
   discord
   dracula-theme
   #entr
   #feh
   ffmpeg_8-full
   firefox
   foot
   grim
   htop
   #inkscape
   #inotify-tools
   #jq
   clang-tools
   llvmPackages.clang
   libcxx
   #libreoffice-qt-fresh
   #libsixel
   luajitPackages.magick
   lua-language-server
   lutris
   #maim
   moreutils
   mpc
   mpdris2
   mpv
   nemo
   nixd
   #obsidian
   pulsemixer
   qbittorrent
   rofi
   slurp
   #swaybg
   #timewarrior
   #tor-browser
   ueberzugpp
   unrar
   unzip
   #vintagestory
   wl-clipboard
   xclip
   #yewtube
   yt-dlp
   zip
   zoom-us
   zathura
   rust-analyzer
  ];
}
