{ pkgs, ... }:
{
  # Concatenate the two lists of packages
 # nixpkgs.config.permittedInsecurePackages = [
 #   "dotnet-runtime-7.0.20"
 # ];
  home.packages = with pkgs; [
    #entr
    moreutils
    discord
    htop
   #timewarrior
    lua-language-server
    pulsemixer
    #rofi
    #wl-clipboard
    #grim
    #slurp
    #swaybg
    bitwarden-desktop
    nemo
    mpv
   #jq
   #inotify-tools
    mpc
   #popcorntime
    firefox
    #foot
    bash-language-server
    nixd
    ueberzugpp
   #libsixel
   #xclip
   #maim
    libclang
    bibata-cursors
   #feh
   #yewtube
    yt-dlp
    qbittorrent
   #tor-browser
    unzip
    zip
    unrar
    lutris
   #inkscape
   #vintagestory
   #audacity
   #obs-studio
    ffmpeg_8-full
    zoom-us
   #obsidian
   #libreoffice-qt-fresh
  ];
}
