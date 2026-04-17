{ user, pkgs, ... }:

{

  imports = [
    ./packages.nix
    ./config/alacritty/alacritty.nix
    ./config/github/gh.nix
    ./config/mpd/mpd.nix
    ./config/ncmpcpp/ncmpcpp.nix
    ./config/nvim/nvim.nix
    ./config/shell/bashrc.nix
    ./config/shell/inputrc.nix
    ./config/shell/profile.nix
    ./config/zoxide/zoxide.nix
    ./config/fzf/fzf.nix
    ./config/tmux/tmux.nix
    ./config/picom/picom.nix
    ./config/obs/obs.nix
    ./config/zathura/zathura.nix
  ];

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  home = {
  # Don't Change!
  stateVersion = "25.05";

  # User
  username = "${user}";
  homeDirectory = "/home/${user}";
};

  xdg.desktopEntries.st = {
    name = "st Terminal";
    comment = "Simple Terminal (suckless)";
    exec = "st";
    terminal = false;
    type = "Application";
    icon = "utilities-terminal"; # or provide a path
    categories = [ "System" "TerminalEmulator" ];
  };

}
