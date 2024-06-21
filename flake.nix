{
  description = "flake config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    nixvim = {
      url = "github:nix-community/nixvim";
    # inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      #sops-nix,
      nixpkgs,
      home-manager,
      stylix,
      ...
    }:
  let
    lib = nixpkgs.lib;
# where is this supposed to go?
# packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs; });
  in
  {
    nixosConfigurations = {
      t470 = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/t470
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit inputs;
                }; # allows access to flake inputs in hm modules
                sharedModules = [ inputs.nixvim.homeManagerModules.nixvim ];
                users.da = import ./home/da;
                #users.desk = import ./home/desk;
#users.guest = import ./home/guest;
              };
            }
        ];
      };

      x220 = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/x220
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit inputs;
                }; # allows access to flake inputs in hm modules
                sharedModules = [ inputs.nixvim.homeManagerModules.nixvim ];
                users.da = import ./home/da;
              };
            }
        ];
      };

    };
  };
}
