{ config, pkgs, ... }:

{
  imports = [
    ./modules/fish.nix
    ./modules/river.nix
    ./modules/neovim.nix
    ./modules/kitty.nix
    ./modules/ncmpcpp.nix
  ];

  home = {
    username = "x";
    homeDirectory = "/home/x";
    stateVersion = "24.11";
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
    packages = with pkgs; [
      # placeholder
    ];
  };


  home.file = {
    # home stuff
  };


  programs = {
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
      core.editor = "nvim";
      init.defaultBranch = "main";
      commit.gpgsign = true;
      user.signingkey = "F0F708E2ED281B48DF26A213DCF60F08282ADCB9";
      };
    };
    home-manager.enable = true;
  };
}
