{ pkgs, config, ... }:

{
  virtualisation.libvirtd = {
  enable = true;
  qemu = {
	  vhostUserPackages = [ pkgs.virtiofsd ]; 
	  vergl = true;
  };
  };

  programs.virt-manager.enable = true;
}
