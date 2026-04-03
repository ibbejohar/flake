{ config, pkgs, ... }:

{
  services = {
    mpd = {
      enable = true;
      musicDirectory = "/media/ColdStorage/music";
      extraConfig = ''
	audio_output {
	type	"pulse"
	name	"pulse audio"
	}
	'';
    };
  };
  systemd.user.services.mpdris2 = {
    Unit.Description = "MPD MPRIS bridge";
    Service.ExecStart = "${pkgs.mpdris2}/bin/mpDris2";
    Install.WantedBy = [ "default.target" ];
  };
}
