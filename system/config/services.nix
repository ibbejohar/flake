{ config, pkgs, username, ... }:

{

  services = {
    xserver = {

      enable = true;

      # Keyboard layout
      layout = "se";
      xkbVariant = "nodeadkeys";

      #videoDrivers = [ "nvidia" ];

      windowManager.dwm.enable = true;

      displayManager = {
          defaultSession = "none+dwm";

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

    printing.enable = true;

    # openssh.enable = true;
  };


}
