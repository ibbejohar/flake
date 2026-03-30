{ config, pkgs, ... }:

{
  programs = {
    readline = {
      enable = true;
      extraConfig = ''
      TAB: menu-complete
      set show-mode-in-prompt on
      set vi-ins-mode-string \1\e[6 q\2
      set vi-cmd-mode-string \1\e[2 q\2
      '';
      variables = {
      colored-stats = true;	
      colored-completion-prefix = true;

      show-all-if-ambiguous = true;
      completion-ignore-case = true;
      };
    };
  };

}
