{ config, pkgs, username, ... }:

{

imports = [
./packages.nix

./config/alacritty/alacritty.nix
./config/foot/foot.nix
#./config/waybar/waybar.nix
./config/taskwarrior/task.nix
./config/dunst/dunst.nix
./config/github/gh.nix
./config/mpd/mpd.nix
./config/ncmpcpp/ncmpcpp.nix
./config/newsboat/newsboat.nix
#./config/nvim/init.nix
./config/pandoc/pandoc.nix
./config/shell/bashrc.nix
./config/shell/inputrc.nix
./config/shell/profile.nix
./config/tmux/tmux.nix
./config/zathura/zathura.nix
./config/rofi/rofi.nix
./config/firefox/firefox.nix
./config/gtk/gtk.nix
];

nixpkgs.config.allowUnfree = true;


home = {

  # DO NOT CHANGE!
	stateVersion = "23.11";

  # USER
	username = "${username}";
	homeDirectory = "/home/${username}";
 
  };

	programs.home-manager.enable = true;

}
