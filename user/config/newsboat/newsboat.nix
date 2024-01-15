{ config, pkgs, ... }:

{
    programs.newsboat = {
        enable = true;

        browser = "newsb";

        extraConfig = ''

        # Colors
        #color listnormal          color244 default
        #color listfocus           color15 color24 
        #color listnormal_unread   color15 default
        #color listfocus_unread    color15 color24 
        #color info                color15 color24   bold
        #color article             color15 default

        # Vim movement
        bind-key j down
        bind-key k up
        bind-key h quit
        bind-key l open
        bind-key g home
        bind-key G end
        bind-key d pagedown
        bind-key u pageup

        # Colorscheme
        color listnormal         color15 default
        color listnormal_unread  color2  default
        color listfocus_unread   color2  color0
        color listfocus          default color0
        color background         default default
        color article            default default
        color end-of-text-marker color8  default
        color info               color4  color8
        color hint-separator     default color8
        color hint-description   default color8
        color title              color14 color8

        highlight all "---.*---" default
        highlight feedlist ".*(0/0))" black
        highlight article "^(Feed|Title|Author|Link|Date): .+" color4 default bold
        highlight article "^(Feed|Title|Author|Link|Date):" color14 default bold

        highlight article "\\((link|image|video)\\)" color8 default
        highlight article "https?://[^ ]+" color4 default
        highlight article "\[[0-9]+\]" color6 default bold

        '';
    };
}
