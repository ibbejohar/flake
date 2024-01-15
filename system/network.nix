{ config, pkgs, hostname, ... }:

{
  networking = {

    hostName = "${hostname}";

    networkmanager.enable = true;

    firewall = {
      enable = true;
      # firewall.allowedTCPPorts = [ ... ];
      # firewall.allowedUDPPorts = [ ... ];
      };
  };
}
