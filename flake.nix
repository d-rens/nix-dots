{
  description = "flake config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  let
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {

      t470 = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/t470
          inputs.stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.da = import ./home/da;
              users.guest = import ./home/guest;
            };
          }
        ];
      };

      x220 = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/x220
          inputs.stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.da = import ./home/da;
              users.guest = import ./home/guest;
            };
          }
        ];
      };

    };
  };
}

