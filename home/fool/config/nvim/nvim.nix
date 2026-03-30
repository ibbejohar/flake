{ config, pkgs, inputs, system, ... }:
let
 neovim-nightly = inputs.neovim-nightly-overlay.packages.${system}.neovim;
in
{
	programs.neovim = {
		enable = true;
		package  = neovim-nightly;
		defaultEditor = true;
		vimAlias = true;
		viAlias = true;
                extraLuaPackages = ps: [ ps.magick ];
                extraPackages =  [ pkgs.imagemagick ];
	};

}
