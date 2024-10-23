{ config, pkgs, ... }:

{

 imports = 
 [
   ./nvidia.nix

 ];

  hardware = {
    graphics.enable = true;
  };
}
