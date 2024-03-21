{ config, pkgs, ... }:

{

 imports = 
 [
   ./nvidia.nix

 ];

  hardware = {
    opengl.enable = true;
  };
}
