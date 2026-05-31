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

}
