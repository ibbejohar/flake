{ config, ... }:

{
  boot = {
    swraid.enable = false;
    loader = {
      systemd-boot = {
      enable = true;
      configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;

      #grub.enable = true;
      #grub.device = "/dev/vda";
      #grub.useOSProber = true;

    };
    extraModprobeConfig = "options kvm_intel nested=1";
  };
}
