{ config, pkgs, ...}:

{
  home.file = {
    ".config/nvim/init.lua".source = ../configs/nvim/init.lua;
    ".config/nvim/after/ftplugin/markdown.lua".source = ../configs/nvim/after/ftplugin/markdown.lua;
    ".config/nvim/lua/d-rens/init.lua".source = ../configs/nvim/lua/d-rens/init.lua;
    ".config/nvim/lua/d-rens/lazy/init.lua".source = ../configs/nvim/lua/d-rens/lazy/init.lua;
    ".config/nvim/lua/d-rens/lazy/keymaps.lua".source = ../configs/nvim/lua/d-rens/lazy/keymaps.lua;
    ".config/nvim/lua/d-rens/lazy/options.lua".source = ../configs/nvim/lua/d-rens/lazy/options.lua;
    ".config/nvim/lua/d-rens/lazy/setuplazy.lua".source = ../configs/nvim/lua/d-rens/lazy/setuplazy.lua;
    ".config/nvim/lua/d-rens/plugins/colorizer.lua".source = ../configs/nvim/lua/d-rens/plugins/colorizer.lua;   
    ".config/nvim/lua/d-rens/plugins/fugitive.lua".source = ../configs/nvim/lua/d-rens/plugins/fugitive.lua;
    ".config/nvim/lua/d-rens/plugins/harpoon.lua".source = ../configs/nvim/lua/d-rens/plugins/harpoon.lua;
    ".config/nvim/lua/d-rens/plugins/img-clip.lua".source = ../configs/nvim/lua/d-rens/plugins/img-clip.lua;
    ".config/nvim/lua/d-rens/plugins/lsp.lua".source = ../configs/nvim/lua/d-rens/plugins/lsp.lua;
    ".config/nvim/lua/d-rens/plugins/obsidian.lua".source = ../configs/nvim/lua/d-rens/plugins/obsidian.lua;
    ".config/nvim/lua/d-rens/plugins/orgmode.lua".source = ../configs/nvim/lua/d-rens/plugins/orgmode.lua;
    ".config/nvim/lua/d-rens/plugins/snippets.lua".source = ../configs/nvim/lua/d-rens/plugins/snippets.lua;
    ".config/nvim/lua/d-rens/plugins/telescope.lua".source = ../configs/nvim/lua/d-rens/plugins/telescope.lua;
    ".config/nvim/lua/d-rens/plugins/theme.lua".source = ../configs/nvim/lua/d-rens/plugins/theme.lua;
    ".config/nvim/lua/d-rens/plugins/todo.lua".source = ../configs/nvim/lua/d-rens/plugins/todo.lua;
    ".config/nvim/lua/d-rens/plugins/treesitter.lua".source = ../configs/nvim/lua/d-rens/plugins/treesitter.lua;
    ".config/nvim/lua/d-rens/plugins/trouble.lua".source = ../configs/nvim/lua/d-rens/plugins/trouble.lua;
    ".config/nvim/lua/d-rens/plugins/undotree.lua".source = ../configs/nvim/lua/d-rens/plugins/undotree.lua;
    ".config/nvim/lua/d-rens/plugins/vimbegood.lua".source = ../configs/nvim/lua/d-rens/plugins/vimbegood.lua;
    ".config/nvim/lua/d-rens/plugins/vimtex.lua".source = ../configs/nvim/lua/d-rens/plugins/vimtex.lua;
    ".config/nvim/lua/d-rens/plugins/zen.lua".source = ../configs/nvim/lua/d-rens/plugins/zen.lua;
  };
}
