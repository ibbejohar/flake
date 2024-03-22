{ pkgs, config, ... }:

{
  programs.alacritty = {
    enable = true;	
    package = pkgs.alacritty;
      settings = {
        window = {
          padding = {
	    x = 4;
	    y = 4;
          };
          dynamic_padding = true;
	  opacity = 0.8;
	};
        cursor = {
            style = {
                shape = "Beam";
            };
            vi_mode_style = {
                shape = "Block";
            };
        };
	colors = {
	  primary = {
	   background = "#0f0f17";
	   foreground = "0xabb2bf";
	 };

	 normal = {
	   black = "0x1e2127";
	   red = "0xe06c75";
	   green = "0x98c379";
	   yellow = "0xd19a66";
	   blue = "0x61afef";
	   magenta = "0xc678dd";
	   cyan = "0x56b6c2";
	   white = "0x828791";
	 };
	 bright = {
	   black = "0x5c6370";
	   red = "0xe06c75";
	   green = "0x98c379";
	   yellow = "0xd19a66";
	   blue = "0x61afef";
	   magenta = "0xc678dd";
	   cyan = "0x56b6c2";
	   white = "0xe6efff";
	 };
	 dim = {
	   black = "0x1e2127";
	   red = "0xe06c75";
	   green = "0x98c379";
	   yellow = "0xd19a66";
	   blue = "0x61afef";
	   magenta = "0xc678dd";
	   cyan = "0x56b6c2";
	   white = "0x828791";
	 };
	};
	font = {
	 size = 13;
	 normal = {
	   family = "JetBrains Mono Nerd Font";
	   style = "Medium";
	 };
	 bold = {
	   family = "JetBrains Mono Nerd Font";
	   style = "Bold";
	 };
	 italic = {
	   family = "JetBrains Mono Nerd Font";
	   style = "Medium Italic";
	 };
	 bold_italic = {
	   family = "JetBrains Mono Nerd Font";
	   style = "Bold Italic";
	 };
	};
    };
  };
}


