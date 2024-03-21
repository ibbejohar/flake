{ config, pkgs, ... }:

{
  hardware = {
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      # Fix Screen Tearing
      forceFullCompositionPipeline = true;
      nvidiaSettings = true;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];
}
