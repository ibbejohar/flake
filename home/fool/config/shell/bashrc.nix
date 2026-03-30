{ config, pkgs, ... }:

{
programs = {

  bash = {
    enable = true;
    bashrcExtra = ''
    export PS1='\[\e[0;1;31m\][\[\e[0;1;38;5;37m\]\u\[\e[0;1;31m\]] \[\e[0;38;5;73m\]\W\[\e[0;1m\] ♠ \[\e[0m\]'
    set -o vi
    '';
    shellAliases = {

    ls = "eza";
    ll = "eza -l";
    l = "eza -la";

    vim = "nvim";
    v = "nvim";

    c = "clear";
    e = "exit";
    df = "df -h -x tmpfs";
    ".." = "cd ..";
    "..." = "cd ../..";
    cal = "cal -w";
    pdf = "zathura";
    sxiv = "nsxiv";
    shutdown = "shutdown now";

    home-switch = "home-manager switch";

    sdc1 = "cd /media/ColdStorage";

    yt-audio = "yt-dlp -x --audio-format mp3 --audio-quality 0";
    zd = "source zd";
    youtube = "youtube-tui";
    reddit = "tuir --enable-media";

    hibernate = "systemctl hibernate";
    code = "cd ~/Documents/code";

    cd = "z";

    };
    shellOptions = [
      "cdspell"
    ];
  };
};
}
