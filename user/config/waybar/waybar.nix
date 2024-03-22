{ config, pkgs, ... }:

{
 programs.waybar.enable = true;
 waybar.override {
    wireplumber = prev.wireplumber.overrideAttrs rec {
      version = "0.4.17";
      src = prev.fetchFromGitLab {
        domain = "gitlab.freedesktop.org";
        owner = "pipewire";
        repo = "wireplumber";
        rev = version;
        hash = "sha256-vhpQT67+849WV1SFthQdUeFnYe/okudTQJoL3y+wXwI=";
      };
    };
  };
}
