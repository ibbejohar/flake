{ config, pkgs, username, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      dwmblocks = prev.dwmblocks.overrideAttrs (old: {
        src = pkgs.fetchFromGitHub {
          owner = "ibbejohar";
          repo = "blocks";
          rev = "f903c6948c54c5cf1b756a48713c788cf49d6fc1";
          hash = "sha256-nkPGn8Lb3VkK+l3fVEXINHMVkdSBpmk7k5i+AG22Pbo=";
        };
      });
    })
  ];
  services = {
#    displayManager = {
#      defaultSession = "none+dwm";
#
#    };
    xserver = {
      windowManager.dwm = {
        enable = true;
        package = pkgs.dwm.overrideAttrs (previousAttrs: {
          name = "dwm";
          src = pkgs.fetchFromGitHub {
            owner = "ibbejohar";
            repo = "dwm";
            rev = "413353ec12fc13634c7f246e49745ae9e43b3455";
            #hash = pkgs.lib.fakeHash;
            hash = "sha256-mpBi/iZ63zdyMcKfyQVdFfYHKI4cfNqOZqH1wQyPIjw=";
          };
        });
      };
#      displayManager = {
#        lightdm = {
#          enable = true;
#          greeters.mini = {
#            enable = true;
#            user = "fool";
#            extraConfig = ''
#            [greeter]
#            show-password-label = true
#            invalid-password-text = Who The Hell Are You?
#            password-alignment = left
#            [greeter-theme]
#            font = "JetBrains Mono Nerd Font";
#            font-size = 15px
#            text-color = "#FFFFFF"
#            border-color = "#0f0f17"
#            window-color = "#0f0f17"
#            password-background-color = "#0f0f17"
#            password-border-color = "#0f0f17"
#            background-image = "/etc/nixos/wallpaper.jpg"
#            '';
#          };
#        };
#      };

    };
  };

}
