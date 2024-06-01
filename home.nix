{ config, pkgs, ... }:

{
  imports = [
    ./modules/fish.nix
    ./modules/kitty.nix
    ./modules/lf.nix
    ./modules/ncmpcpp.nix
    ./modules/neovim.nix
    ./modules/river.nix
    ./modules/waybars.nix
    ./modules/zathura.nix
  ];

  home = {
    username = "x";
    homeDirectory = "/home/x";
    stateVersion = "24.11";
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };


  programs = {

    neovim = {
        enable = true;
        defaultEditor = true;
    };

    alacritty.enable = true;

    tmux = {
        enable = true;
        extraConfig = ''
            bind-key h select-pane -L
            bind-key j select-pane -D
            bind-key k select-pane -U
            bind-key l select-pane -R
            set -g prefix C-s
            set -g status-position top
        '';
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
        core.editor = "nvim";
        init.defaultBranch = "main";
        commit.gpgsign = true;
        user.signingkey = "F0F708E2ED281B48DF26A213DCF60F08282ADCB9";
        };
    };

    home-manager.enable = true;
  };
}
