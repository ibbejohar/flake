{ pkgs, config, ... }:

{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        vhostUserPackages = [ pkgs.virtiofsd ]; 
      };
    };
    podman = {
      enable = true;
      dockerCompat = true;
    };
  };

  programs.virt-manager.enable = true;
}
