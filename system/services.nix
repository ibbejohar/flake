{ config, pkgs, username, ... }:

{

  services = {
    xserver = {

      enable = true;

      # Keyboard layout
      layout = "se";
      xkbVariant = "nodeadkeys";

      #videoDrivers = [ "nvidia" ];
      #screenSection = ''
      #Option      "metamodes" "nvidia-auto-select +0+0 {ForceCompositionPipeline=On}"
      #'';

      windowManager.dwm.enable = true;

      displayManager = {
          defaultSession = "none+dwm";

          lightdm = {
            enable = true;
            greeters.mini = {
              enable = true;
              user = "${username}";
              extraConfig = ''
                [greeter]
                show-password-label = true
                invalid-password-text = Who The Hell Are You?
                password-aligment = left
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

# Move the overlays to its own module
nixpkgs.overlays = [
(final: prev: {
    dwm = prev.dwm.overrideAttrs (old: { src = builtins.fetchGit "https://github.com/ibbejohar/dwm"; });
    dwmblocks = prev.dwm.overrideAttrs (old: { src = builtins.fetchGit "https://github.com/ibbejohar/blocks"; });
  })
];

}
