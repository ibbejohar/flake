{ pkgs, config, ... }:

{
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.vhostUserPackages = [ pkgs.virtiofsd ];
  programs.virt-manager.enable = true;
}
