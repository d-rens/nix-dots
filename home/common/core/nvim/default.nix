{
  configs,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = [
    ./git/gitsigns.nix
    ./telescope/telescope.nix
    ./utils/colorizer.nix
    ./utils/better-escape.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;

    colorschemes.modus.enable = true;
  };
}
