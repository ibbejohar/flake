{ config, pkgs, ... }:

{

	home.username = "fool";
	home.homeDirectory = "/home/fool";

	programs.git = {
		enable = true;
		userName = "Ibrahim Johar";
		userEmail = "ibbe.johar@gmail.com";
	};

	home.packages = with pkgs; [
	neofetch
  bitwarden
  gh
	];

	home.stateVersion = "23.11";

	programs.home-manager.enable = true;

}
