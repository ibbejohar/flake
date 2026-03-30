{ config, pkgs, ... }:

{
  programs = {
    gh = {
      enable = true;
    };
    git = {
      enable = true;
      userName = "Ibrahim Johar";
      userEmail = "ibbe.johar@gmail.com";
      };
    };
}
