{ config, pkgs, ... }:

{
  programs = {
    rofi = {
      enable = true;
      configPath = "$XDG_CONFIG_HOME/rofi/config.rasi";
      font = "JetBrains Mono Nerd Font Medium 12";
      extraConfig = {
          kb-row-up = "Up, Control+k";
          kb-row-down = "Down, Control+j";
          kb-accept-entry = "Return, KP_Enter";
          kb-remove-char-back = "BackSpace";
        };
    };
  };

}
