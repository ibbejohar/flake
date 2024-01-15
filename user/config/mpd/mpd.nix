{ config, pkgs, ... }:

{
  services = {
    mpd = {
      enable = true;
      musicDirectory = "/media/sdc1/music";
      extraConfig = ''
	audio_output {
	type	"pulse"
	name	"pulse audio"
	}
	'';
    };
  };

}
