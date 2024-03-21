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

}
