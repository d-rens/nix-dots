{
  description = "flake config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  let
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      t470 = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/t470/configuration.nix
          ./hosts/t470/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.x = import ./home.nix;
            };
          }
        ];
      };

      x220 = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/x220/configuration.nix
          ./hosts/x220/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.x = import ./home.nix;
            };
          }
        ];
      };
    };
  };
}

