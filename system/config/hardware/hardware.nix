{ config, pkgs, ... }:

{
  imports = [
    ./nvidia.nix
  ];

  hardware.graphics = {
  enable = true;
  enable32Bit = true;
  #extraPackages = with pkgs; [ intel-media-driver ];
  };

  extraPackages = with pkgs; [
    vulkan-loader
  ];
  extraPackages32 = with pkgs.pkgsi686Linux; [
    vulkan-loader
  ];

}
