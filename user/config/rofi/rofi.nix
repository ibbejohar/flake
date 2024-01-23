{ config, pkgs, ... }:

{
  programs = {
    rofi = {
      enable = true;
      font = "JetBrains Mono Nerd Font Medium 12";
      extraConfig = {
          kb-row-down = "Down,Control+j";
          kb-row-up = "Up,Control+k";
          kb-accept-entry = "Return,KP_Enter";
          kb-remove-char-back = "BackSpace";
        };
    };
  };

}
