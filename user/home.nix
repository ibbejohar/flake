{ config, pkgs, ... }:

{

imports = [
./packages.nix

./config/alacritty/alacritty.nix
./config/dunst/dunst.nix
./config/github/gh.nix
./config/mpd/mpd.nix
./config/ncmpcpp/ncmpcpp.nix
./config/newsboat/newsboat.nix
./config/nvim/init.nix
./config/pandoc/pandoc.nix
./config/shell/bashrc.nix
./config/shell/inputrc.nix
./config/shell/profile.nix
./config/tmux/tmux.nix
./config/zathura/zathura.nix
];

nixpkgs.config.allowUnfree = true;

home = {

  # DO NOT CHANGE!
	stateVersion = "23.11";

  # USER
	username = "fool";
	homeDirectory = "/home/fool";
 
  };

	programs.home-manager.enable = true;

}
