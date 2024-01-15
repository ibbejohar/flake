{
  description = "Fool's Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  let
    username = "fool";
    hostname = "Selfirah";
  in 
  {
    nixosConfigurations = { 
      # Hostname
      ${hostname} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit username; inherit hostname; };
        modules = [
          ./system/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = { inherit username; inherit hostname; };
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${username} = import ./user/home.nix;
              }; 
            }
        ];
      };

    };

  };
}
