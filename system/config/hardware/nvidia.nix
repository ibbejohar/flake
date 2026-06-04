{ config, pkgs, ... }:

{
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    #package = config.boot.kernelPackages.nvidiaPackages.production;
    #package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    nvidiaSettings = true;
    modesetting.enable = true;
    open = false;
  };
  hardware.nvidia-container-toolkit.enable = true; # For Distrobox

  services.xserver.videoDrivers = [ "nvidia" ];

}
