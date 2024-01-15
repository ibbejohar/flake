{ pkgs, config, ... }:

{

services.dunst = {
    enable = true;
    settings = {
        global = {
        width = 300;
        height = 300;
        font = "JetBrains Mono Nerd Font 15";
        #frame_color = "#314f57";
        frame_color = "#171723";
        max_icon_size = 64;
        };

        urgency_normal = {
            background = "#171723";
            timeout = 4;

        };

    };
};

}
