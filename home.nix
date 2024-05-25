{ config, pkgs, ... }:

{
  imports = [
    ./modules/fish.nix
    ./modules/nvim.nix
    ./modules/kitty.nix
  ];

  home = {
    username = "x";
    homeDirectory = "/home/x";
    stateVersion = "24.05";
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
    packages = with pkgs; [
      fish
    ];
  };


  home.file = {
    # home stuff
  };



  programs = {
    fish = {
      # not working
      interactiveShellInit = "fastfetch";
    };
    git = {
      enable = true;
      userName = "d-rens";
      userEmail = "daniel@d-rens.xyz";
      aliases = {
        p = "push";
        pu = "pull";
        c = "commit -m";
        cs = "commit -m -S";
        ca = "commit -m --ammend";
        csa = "commit -m -S --ammend";
      };
    extraConfig = {
      init.defaultBranch = "main";
      commit.gpgsign = true;
      user.signingkey = "F0F708E2ED281B48DF26A213DCF60F08282ADCB9";
      };
    };
    home-manager.enable = true;
  };
}
