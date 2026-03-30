{ config, host, ... }:

{

  networking = {
    hostName = "${host}";
    networkmanager.enable = true;

    firewall.enable = false;
  # firewall.allowedTCPPorts = [ ... ];
  # firewall.allowedUDPPorts = [ ... ];

 };
}
