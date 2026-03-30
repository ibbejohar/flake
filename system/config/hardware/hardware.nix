{ config, pkgs, ... }:

{
  imports = [
    ./nvidia.nix
  ];

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
}
