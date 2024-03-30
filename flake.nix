{
  description = "Fool's Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nur, neovim-nightly-overlay, ... }:
  let
    username = "fool";
    hostname = "Selfirah";
    system = "x86_64-linux";
  in 
  {
    nixosConfigurations = { 
      # Hostname
      ${hostname} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit username; inherit hostname; inherit system inputs; };
        modules = [
          ./system/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = { inherit username; inherit hostname; inherit system inputs; };
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${username} = import ./user/home.nix;
              }; 
            }
            { nixpkgs.overlays = [ nur.overlay ]; }
            ({ pkgs, ... }: 
            let
              nur-no-pkgs = import  nur {
                nurpkgs = import nixpkgs { system = "x86_64-linux"; };
              };
            in {
              imports = [ nur-no-pkgs.repos.iopq.modules.xraya ];
              services.xraya.enable = true;
            })
        ];
      };

    };

  };
}
