{ config, ... }:

{
  boot = {
    swraid.enable = false;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    extraModprobeConfig = "options kvm_intel nested=1";
  };
}
