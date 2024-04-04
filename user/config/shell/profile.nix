{ config, ... }:

{
  home = {
    sessionPath = [
          "$HOME/.local/bin"
    ];
    sessionVariables = {
       EDITOR = "nvim";
       TERMINAL = "foot";
       TERM = "foot";
       BROWSER = "firefox";
       DMENU = "rofi -dmenu";
       PDF = "zathura";
       VIDEO = "mpv";
       PICTURE = "nsxiv";
       NIXPKGS_ALLOW_INSECURE = 1;

       XDG_CONFIG_HOME = "$HOME/.config";
       XDG_CACHE_HOME = "$HOME/.cache";
       XDG_DATA_HOME = "$HOME/.local/share";
       XDG_STATE_HOME = "$HOME/.local/state";
       XDG_BIN_HOME = "$HOME/.local/bin";

       # Mangal env
       MANGAL_READER_PDF = "zathura";
       MANGAL_DOWNLOADER_PATH = "$HOME/Documents/manga";
    };
  };
}
