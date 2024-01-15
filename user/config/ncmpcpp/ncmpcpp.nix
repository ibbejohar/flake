{ config, pkgs, ... }:

{

  programs = {
    ncmpcpp = {
      enable = true;
      mpdMusicDir = "/media/ColdStorage/music";
    };
  };

}
