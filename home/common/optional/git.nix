{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    git
    lazygit
  ];
  programs.git = {
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
}
