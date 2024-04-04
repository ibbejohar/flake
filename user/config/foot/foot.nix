{ config, pkgs, ... }:

{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        font = "JetBrains Mono Nerd Font:size=13";
	pad = "4x0 center";

      };
      colors = {
        foreground = "abb2bf";
        background = "0f0f17";

	regular0 = "1e2127"; # Black
	regular1 = "e06c75"; # Red
	regular2 = "98c379"; # Green
	regular3 = "d19a66"; # Yellow
	regular4 = "61afef"; # Blue
	regular5 = "c678dd"; # Magenta
	regular6 = "56b6c2"; # Cyan
	regular7 = "828791"; # White

	bright0 = "5c6370"; # Black  
	bright1 = "e06c75"; # Red
	bright2 = "98c379"; # Green
	bright3 = "d19a66"; # Yellow
	bright4 = "61afef"; # Blue
	bright5 = "c678dd"; # Magenta
	bright6 = "56b6c2"; # Cyan
	bright7 = "e6efff"; # White

	dim0 = "1e2127"; # Black  
	dim1 = "e06c75"; # Red
	dim2 = "98c379"; # Green
	dim3 = "d19a66"; # Yellow
	dim4 = "61afef"; # Blue
	dim5 = "c678dd"; # Magenta
	dim6 = "56b6c2"; # Cyan
	dim7 = "828791"; # White

	alpha = "0.8";
      };

    };
  };
}
