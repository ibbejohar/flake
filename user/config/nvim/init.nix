{ pkgs, config, inputs, system, ... }: 
let
  neovim-nightly = inputs.neovim-nightly-overlay.packages.${system}.neovim;
in
{
  imports = [
   #./lua/config.nix
   # ./lua/settings.nix
   #./lua/plugins.nix
   # ./lua/telescope.nix
   # ./lua/lsp_config.nix
   # ./lua/nvim_cmp.nix
   # ./lua/statusline.nix
  ];
 
  programs.neovim = {
    enable = true;
    package = neovim-nightly;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    extraLuaPackages = ps: [ ps.magick ];
  };

}

