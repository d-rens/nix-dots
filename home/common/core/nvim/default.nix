{
  ...
}:

{
  imports = [
    ./options.nix
    ./keymaps.nix

    ./completion/cmp.nix
    ./completion/lspkind.nix

    ./git/gitsigns.nix

    ./lsp/lsp.nix
    ./lsp/trouble.nix

    ./telescope/telescope.nix

    ./ui/indent-blankline.nix

    ./utils/better-escape.nix
    ./utils/colorizer.nix
    ./utils/oil.nix
    ./utils/vimtex.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;

    colorschemes = {
    modus = {
      enable = true;
      settings = {
        transparent = true;
      };
    };
    };
  };
}
