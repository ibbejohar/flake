{ config, pkgs, ... }:

{

  programs.tmux = {

    enable = true;
    mouse = true;
    terminal = "screen-256color";
    extraConfig = ''
      set-option -gas terminal-overrides "*:Tc"
      set-option -gas terminal-overrides "*:RGB"
     '';

  };

}

