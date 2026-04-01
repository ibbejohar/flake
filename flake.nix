{
  inputs = {
    # Wide System
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    #nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    # Stable Branch
    nixpkgsStable.url = "github:NixOS/nixpkgs/nixos-25.05";
    # User System
    home-manager = {
      url = "github:nix-community/home-manager";
      #url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Neovim Nightly Build
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    dwl-custom.url = "github:ibbejohar/dwl";
    dwm-custom.url = "github:ibbejohar/dwm";
    dwm-custom.inputs.nixpkgs.follows = "nixpkgs";
    st-custom.url = "github:ibbejohar/st";
    norgolith.url = "github:NTBBloodbath/norgolith";
  };
  outputs = inputs@{ self, nixpkgs, nixpkgsStable, home-manager, neovim-nightly-overlay, dwl-custom, dwm-custom, norgolith, st-custom, ... }: 
  let
    user = "fool";
    host = "selfirah";
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      ${host} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs system host user; };
        modules = [ 
          ./system/configuration.nix 
          home-manager.nixosModules.home-manager {
            home-manager = {
              extraSpecialArgs = { inherit inputs system host user; };
              useGlobalPkgs = false;
              useUserPackages = true;
              users.${user} = import ./home/${user}/home.nix;
            };

          }

        ];

      };

    };

  };
}
