{
  description = "flake config for nixos";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    #nixpkgs.url = "nixpkgs/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      # adds firefox addons from NUR
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{
      self,
      sops-nix,
      nixpkgs,
      home-manager,
      stylix,
      ...
    }:
    let
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        t470 = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/t470
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            sops-nix.nixosModules.sops
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit inputs;
                }; # allows access to flake inputs in hm modules
                sharedModules = [ 
                  inputs.nixvim.homeManagerModules.nixvim 
                  inputs.sops-nix.homeManagerModules.sops
                ];
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
            sops-nix.nixosModules.sops
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit inputs;
                }; # allows access to flake inputs in hm modules
                sharedModules = [ 
                  inputs.nixvim.homeManagerModules.nixvim 
                  inputs.sops-nix.homeManagerModules.sops
                ];
                users.da = import ./home/da;
              };
            }
          ];
        };

      };
    };
}
