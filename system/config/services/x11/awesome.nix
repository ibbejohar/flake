{ config, pkgs, username, ... }:

{
  services = {
    displayManager = {
      sddm.enable = true;
      defaultSession = "none+awesome";
    };
    xserver = {
      windowManager.awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks
          luadbi-mysql
        ];
      };
    };
  };
}
