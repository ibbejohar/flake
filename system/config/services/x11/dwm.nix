{ config, pkgs, username, ... }:

{
  services = {
    displayManager = {
      defaultSession = "none+dwm";

    };
    xserver = {
      windowManager.dwm = {
        enable = true;
        package = pkgs.dwm.overrideAttrs {
          src = ./suckless/dwm;
        };
      };
      displayManager = {
        lightdm = {
          enable = true;
          greeters.mini = {
            enable = true;
            user = "fool";
            extraConfig = ''
            [greeter]
            show-password-label = true
            invalid-password-text = Who The Hell Are You?
            password-alignment = left
            [greeter-theme]
            font = "JetBrains Mono Nerd Font";
            font-size = 15px
            text-color = "#FFFFFF"
            border-color = "#0f0f17"
            window-color = "#0f0f17"
            password-background-color = "#0f0f17"
            password-border-color = "#0f0f17"
            background-image = "/etc/nixos/wallpaper.jpg"
            '';
          };
        };
      };

    };
  };

}
