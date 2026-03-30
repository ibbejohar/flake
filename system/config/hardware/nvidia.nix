{ config, pkgs, ... }:

{
  hardware.nvidia = {
    #package = config.boot.kernelPackages.nvidiaPackages.stable;
    package = config.boot.kernelPackages.nvidiaPackages.production;
    nvidiaSettings = true;
    modesetting.enable = true;
    open = false;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

}
