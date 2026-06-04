{ config, pkgs, ... }:

{
  programs = {
    gh = {
      enable = true;
    };
    git = {
      enable = true;
      user.name = "Ibrahim Johar";
      user.email = "ibbe.johar@gmail.com";
      };
    };
}
