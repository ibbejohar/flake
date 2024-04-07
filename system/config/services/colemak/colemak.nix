{ config, pkgs, ... }:

{
  services.xserver.xkb.extraLayouts.colemak = {
    description = "Swedish colemak layout";
    languages = [ "swe" ];
    symbolsFile = colemak-se;

  };
}
