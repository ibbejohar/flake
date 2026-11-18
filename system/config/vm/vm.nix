{ pkgs, config, ... }:

{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        vhostUserPackages = [ pkgs.virtiofsd ]; 
      };
    };
    # podman = {
    #   enable = true;
    #   dockerCompat = true;
    # };
    docker = {
      enable = true;
    };
  };

  programs.virt-manager.enable = true;
}
