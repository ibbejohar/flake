{ config, pkgs, ... }:

{
  hardware = {
    opengl.enable = true;
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      # Fix Screen Tearing
      forceFullCompositionPipeline = true;
    };
  };
}
