{ config, user, ... }:

{
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "keyd" "libvirtd" "kvm" ];
  };
}
