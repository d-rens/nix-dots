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


  programs = {
    tmux = {
        enable = true;
        extraConfig = ''
            bind C-l send-keys 'C-l'
            bind g new-window -n '' lazygit
            bind-key , kill-session
            bind-key h select-pane -L
            bind-key j select-pane -D
            bind-key k select-pane -U
            bind-key l select-pane -R
            set -g prefix C-s
            set -g status-position top
            set -s default-terminal "tmux-256color"
            setw -g mode-keys vi
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
