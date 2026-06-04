{ config, pkgs, ... }:

{
  programs = {
    gh = {
      enable = true;
    };
    git = {
      enable = true;
      settings = {
        user.name = "Ibrahim Johar";
        user.email = "ibbe.johar@gmail.com";
      };
      };
    };
}
