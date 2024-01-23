{ config, pkgs, ... }:

{
  programs = {
    rofi = {
      enable = true;
      font = "JetBrains Mono Nerd Font Medium 12";
      extraConfig = {
          kb-row-down = "Down,Control+j";
          kb-row-up = "Up,Control+k";
          kb-accept-entry = "Return,KP_Enter";
          kb-remove-char-back = "BackSpace";
          kb-remove-to-eol = "Control+Shift+e";
        };
        theme = "~/.config/rofi/purplesweet.rasi";
    };
  };

  home.file.".config/rofi/purplesweet.rasi" = {
    text = ''
    * {
    font:   "JetBrains Mono Nerd Font Medium 12";

    bg0:     #171723;
    bg1:     #171723;
    fg0:     #eeeeee;

    accent-color:     #314f57;
    urgent-color:     #DBBC7F;

    background-color:   transparent;
    text-color:         @fg0;

    margin:     0;
    padding:    0;
    spacing:    0;
}

window {
    location:   center;
    width:      480;

    background-color:   @bg0;
    border-radius: 5;
}

inputbar {
    spacing:    8px; 
    padding:    8px;

    background-color:   @bg1;
}

prompt, entry, element-icon, element-text {
    vertical-align: 0.5;
}

prompt {
    text-color: @bg1;
    font: "mono bold 13";
    background-color: @accent-color;
    padding: 5px;
    border-radius: 5;
}

textbox {
    padding:            8px;
    background-color:   @bg1;
}

listview {
    padding:    2px 0;
    lines:      5;
    columns:    1;

    fixed-height:   false;
}

element {
    padding:    5px;
    spacing:    8px;
}

element normal normal {
    text-color: @fg0;
}

element normal urgent {
    text-color: @urgent-color;
}

element normal active {
    text-color: @accent-color;
}

element selected {
    text-color: @bg0;
}

element selected normal, element selected active {
    background-color:   @accent-color;
}

element selected urgent {
    background-color:   @urgent-color;
}

element-icon {
    size:   0.8em;
}

element-text {
    text-color: inherit;
}

    '';

  };

}
