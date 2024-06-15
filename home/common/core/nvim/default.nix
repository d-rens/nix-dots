{
  configs,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = [
    ./completion/cmp.nix
    ./completion/lspkind.nix
    ./git/gitsigns.nix
    ./telescope/telescope.nix
    ./utils/colorizer.nix
    ./utils/better-escape.nix
    ./utils/oil.nix
    ./ui/indent-blankline.nix
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
