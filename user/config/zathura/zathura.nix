{ pkgs, config, ... }:

{
  programs.zathura = {
    enable = true;
    options = {
      font = "JetBrains Mono Nerd Font 12";
      recolor = true;

      completion-group-bg = "#0f0f17";
      completion-group-fg = "#eeeeee";
      completion-bg = "#171723";
      completion-fg = "#eeeeee";
      completion-highlight-bg = "#458588";
      completion-highlight-fg = "#eeeeee";

      notification-error-bg = "#171723";
      notification-error-fg = "#eeeeee";
      notification-warning-bg = "#314f57";
      notification-warning-fg = "#eeeeee";
      notification-bg = "#3c3836";
      notification-fg = "#eeeeee";

      index-bg = "#0f0f17";
      index-fg = "#eeeeee";
      index-active-bg = "#314f57";
      index-active-fg = "#eeeeee";

      inputbar-bg = "#171723";
      inputbar-fg = "#eeeeee";

      statusbar-bg ="#0f0f17";
      statusbar-fg = "#eeeeee";

      highlight-color = "#314f57";
      highlight-active-color = "#458588";

      default-bg = "#0f0f17";
      default-fg = "#eeeeee";
      recolor-lightcolor = "#0f0f17";
      recolor-darkcolor = "#eeeeee";
    };
    mappings = {
      f = "toggle_fullscreen";
      i = "recolor";
    };
  
  };

}
