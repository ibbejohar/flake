{ config, inputs, system, pkgs, ... }:

{
  imports = [
  #./de/gnome.nix
  ./de/cinnamon.nix
  #./wm/river.nix
  #./wm/hyprland.nix
  # ./wm/dwl.nix
  # ./wm/dwm.nix
];

services = {
  xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    xkb.layout = "se";
  };
  printing.enable = false;

  pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };
   openssh.enable = true;

  keyd = {
    enable = true;
    keyboards.corne.settings = {
      global = {
        default_layout = "secolemak-se";
      };
      "colemak-se:layout" = {
        q = "q";
        w = "w";
        e = "f";
        r = "p";
        t = "g";
        y = "j";
        u = "l";
        i = "u";
        o = "y";
        p = ";"; # ö
        leftbrace = "leftbrace";
        a = "a";
        s = "r";
        d = "s";
        f = "t";
        g = "d";
        h = "h";
        j = "n";
        k = "e";
        l = "i";
        semicolon = "o";
        apostrophe = "'";
        z = "z";
        x = "x";
        c = "c";
        v = "v";
        b = "b";
        n = "k";
        m = "m";
      };
      main = {
        capslock = "overloadt(control, esc, 200)";
        tab = "overloadt(sym, tab, 200)";
      };
      sym = {
        q = "macro(_)";            # ?
        w = "*";      # (
        e = "(";                   # )
        r = "U+1F511";                   # &
        t = "#";                   # #
        y = "+";                   # +
        u = "macro(7)";            # 7
        i = "macro(8)";            # 8
        o = "macro(9)";            # 9
        p = "<";                   # <

        a = "macro(rightalt+2)";   # @
        s = "macro(rightalt+7)";   # {
        d = "macro(rightalt+0)";   # }
        f = "macro(&)";            # /
        g = "macro(rightalt+4)";   # $
        h = "macro(0)";            # 0
        j = "macro(4)";            # 4
        k = "macro(5)";            # 5
        l = "macro(6)";            # 6
        ";" = "macro(>)";          # >
        "'" = "@";    # "

        z = "macro(rightalt++)";   # \
        x = "macro(rightalt+8)";   # [
        c = "macro(rightalt+9)";   # ]
        v = "macro(shift+5)";      # %
        b = "macro(shift+1)";      # !
        n = "macro(shift+0)";      # =
        m = "macro(1)";            # 1
        "," = "macro(2)";          # 2
        "." = "macro(3)";          # 3
        "/" = "macro(rightalt+<)"; # <
      };
    };
  };

};

}
