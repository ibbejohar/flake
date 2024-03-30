{ config, pkgs, ... }:

{
programs = {

  bash = {
    enable = true;
    bashrcExtra = ''
    echo "Be So Good That They Can't Ignore You"
    export PS1='\[\e[0;1;31m\][\[\e[0;1;38;5;37m\]\u\[\e[0;1;31m\]] \[\e[0;38;5;73m\]\W\[\e[0;1m\] ♠ \[\e[0m\]'
    set -o vi
    # bind -x '"zd\t": zd'
    '';
    shellAliases = {

    ls = "eza";
    ll = "eza -l";
    l = "eza -la";

    vim = "nvim";
    v = "nvim";

    c = "clear";
    e = "exit";
    df = "df -h";
    ".." = "cd ..";
    "..." = "cd ../..";
    cal = "cal -w";
    pdf = "zathura";
    shutdown = "shutdown now";

    home-switch = "home-manager switch";

    sdc1 = "cd /media/sdc1";

    yt-audio = "yt-dlp -x --audio-format mp3 --audio-quality 0";
    zd = "source zd";
    youtube = "youtube-tui";
    reddit = "tuir --enable-media";

    hibernate="systemctl hibernate";
    code = "cd ~/Documents/code";

    flake = "sudo nixos-rebuild switch --flake ~/.config/flake";

    };
    shellOptions = [
      "cdspell"
    ];
  };
};
}
