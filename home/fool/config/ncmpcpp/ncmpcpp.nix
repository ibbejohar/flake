{ pkgs, lib, system, inputs, ... }:
let 
  stablePkgs = inputs.nixpkgsStable.legacyPackages.${system};
in
{
  programs = {
    ncmpcpp = {
      enable = true;
      package = stablePkgs.ncmpcpp;
      mpdMusicDir = "/media/ColdStorage/music";
      settings = {
        mpd_host = "localhost";
        mpd_port = "6600";

        lyrics_directory = "~/.config/ncmpcpp/";
        ncmpcpp_directory = "~/.config/ncmpcpp/";
      };
      bindings = [  
      { key = "j"; command = "scroll_down"; }  
      { key = "k"; command = "scroll_up"; }  
      { key = "J"; command = [ "select_item" "scroll_down" ]; }  
      { key = "K"; command = [ "select_item" "scroll_up" ]; }
      ];
    };
  };

}
