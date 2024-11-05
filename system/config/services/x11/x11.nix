{ config, pkgs, username, ... }:
let
  # Define the layout file content directly here.
  colemakeSeFile = pkgs.writeTextFile {
    name = "colemake-se";
    text = ''
    // Colemak-SE symbols for xkb on X.org Server 7.x
    // 2018, github.com/motform/colemak-se. GPL3.
    // Only remaps keys that diff.

    partial alphanumeric_keys
    xkb_symbols "colemake-se" {

      include "se(basic)"
      name[Group1]="Swedish (Colemak)";

      // top row
      key <AD03> { [ f, F ] };
      key <AD04> { [ p, P ] };
      key <AD05> { [ g, G ] };
      key <AD06> { [ j, J ] };
      key <AD07> { [ l, L ] };
      key <AD08> { [ u, U ] };
      key <AD09> { [ y, Y ] };
      key <AD10> { [ odiaeresis, Odiaeresis ] };
      key <AD11> { [ aring, Aring ] };

      // home row
      key <AC02> { [ r, R ] };
      key <AC03> { [ s, S ] };
      key <AC04> { [ t, T ] };
      key <AC05> { [ d, D ] };
      key <AC06> { [ h, H ] };
      key <AC07> { [ n, N ] };
      key <AC08> { [ e, E ] };
      key <AC09> { [ i, I ] };
      key <AC10> { [ o, O ] };

      // bottom row
      key <AB06> { [ k, K ] };
    };
    '';
  };
in {
  imports = 
  [
    ./dwm.nix
    ./awesome.nix

  ];
  services = {
    xserver = {
      enable = true;

      # Keyboard layout
      xkb.layout = "se";
      xkb.variant = "nodeadkeys";
      xkb.extraLayouts = {
        colemake-se = {
          description = "Colemake Swedish layout";
          languages = [ "sv" ];
          #symbolsFile = "${self}/system/config/services/x11/xkb/colemake-se";
          symbolsFile = "${colemakeSeFile}";
        };
      };

    };
#    keyd = { 
#      enable = true;
#      keyboards = {
#        default = {
#          ids = [ "*" ];
#          settings = {
#            main = {
#              capslock = "tap_hold 200 esc control";
#            };
#          };
#        };
#      };
#    };
keyd = {
  enable = true;
  configFile = "/etc/keyd/default.conf";
};
systemd.services.keyd.preStart = ''
echo 'capslock = tap_hold 200 esc control' > /etc/keyd/default.conf
'';
  };
}
