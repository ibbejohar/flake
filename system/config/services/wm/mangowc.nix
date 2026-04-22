{ config, ... }:
{
  programs.mangowc.enable = true;
  programs.dms-shell = {
    enable = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    enableSystemMonitoring = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
}
