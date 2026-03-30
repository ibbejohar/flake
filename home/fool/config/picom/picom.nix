{ config, ... }:

{
  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
    extraArgs = [ "--transparent-clipping" ];
    opacityRules = [ "100:class_g = 'Alacritty'" ];
    settings = {
      use-damage = true;
      transparent-clipping = true;
      transparent-clipping-exclude = [
        "class_g = 'Alacritty' && !fullscreen"
        "class_g = 'slop'" 
        "class_g = 'firefox'"
        "class_g = 'Rofi'"
      ];
       blur = { 
         method = "dual_kawase";
         size = 10;
         strength = 6.0;
       };
       blur-background = true;
       blur-background-exclude = [
         "class_g = 'firefox'"
         "class_g = 'Alacritty' && !fullscreen"
         "class_g = 'slop'" # X11 screenshot maim
       ];
    };
    wintypes = { 
      menu.shadow = false;
      dropdown_menu.shadow = false;
      popup_menu.shadow = false;
      utility.shadow = false;
    };
  };
}
