{ pkgs, config, ... }:

{
  home = {
    packages = with pkgs; [
      libnotify
      hyprlock
      hypridle
      angband
      anki
      audacity
      bitwarden
      bk
      cargo
      cinnamon.nemo
      cryptsetup
      deno
      discord
      dunst
      eza
      feh
      ffmpeg-full
      file
      fzf
      gcc
      gimp
      go
      htmlq
      htop
      imagemagick
      jq
      libqalculate
      luajit
      luajitPackages.magick
      luarocks
      lutris
      lxappearance
      maim
      mpc-cli
      mpd
      mpv
      newsboat
      nodePackages_latest.bash-language-server
      nodePackages_latest.pyright
      nodePackages_latest.readability-cli
      nodejs
      nsxiv
      openssl
      pass
      passExtensions.pass-tomb 
      pinentry
      pkg-config
      popcorntime
      porsmo
      prismlauncher
      pulsemixer
      python3
      qalculate-gtk
      qbittorrent
      rust-analyzer
      rustc
      sc-im
      slides
      socat
      steamPackages.steamcmd
      swaybg
      telegram-desktop
      texlive.combined.scheme-full
      thunderbird
      tofi
      tomb
      tuir
      ueberzugpp
      unrar-wrapper
      unzip
      wezterm
      wiki-tui
      wineWowPackages.staging
      xclip
      youtube-tui
      yt-dlp
      zip
      ];
  };

}
