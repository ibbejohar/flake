{ config, pkgs, username, ... }:

{
  services.xserver.windowManager.dwm.enable = true;

# Move the overlays to its own module
  nixpkgs.overlays = [
	(final: prev: {
#        	dwm = prev.dwm.overrideAttrs (old: { src = builtins.fetchGit "https://github.com/ibbejohar/dwm"; });
        	dwm = prev.dwm.overrideAttrs (old: { src = /home/fool/.config/suckless/dwm ; });
#		dwmblocks = prev.dwmblocks.overrideAttrs (old: { src = builtins.fetchGit "https://github.com/ibbejohar/blocks"; });
		dwmblocks = prev.dwmblocks.overrideAttrs (old: { src = /home/fool/.config/suckless/blocks; });
	})
  ];
}
