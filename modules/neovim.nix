{ config, pkgs, ...}:

{
    xdg.configFile = {
        "nvim/init.lua".source = ../configs/nvim/init.lua;
        "nvim/after/ftplugin/markdown.lua".source = ../configs/nvim/after/ftplugin/markdown.lua;
        "nvim/lua/d-rens/init.lua".source = ../configs/nvim/lua/d-rens/init.lua;
        "nvim/lua/d-rens/lazy/init.lua".source = ../configs/nvim/lua/d-rens/lazy/init.lua;
        "nvim/lua/d-rens/lazy/keymaps.lua".source = ../configs/nvim/lua/d-rens/lazy/keymaps.lua;
        "nvim/lua/d-rens/lazy/options.lua".source = ../configs/nvim/lua/d-rens/lazy/options.lua;
        "nvim/lua/d-rens/lazy/setuplazy.lua".source = ../configs/nvim/lua/d-rens/lazy/setuplazy.lua;
        "nvim/lua/d-rens/plugins/colorizer.lua".source = ../configs/nvim/lua/d-rens/plugins/colorizer.lua;   
        "nvim/lua/d-rens/plugins/fugitive.lua".source = ../configs/nvim/lua/d-rens/plugins/fugitive.lua;
        "nvim/lua/d-rens/plugins/harpoon.lua".source = ../configs/nvim/lua/d-rens/plugins/harpoon.lua;
        "nvim/lua/d-rens/plugins/img-clip.lua".source = ../configs/nvim/lua/d-rens/plugins/img-clip.lua;
        "nvim/lua/d-rens/plugins/lsp.lua".source = ../configs/nvim/lua/d-rens/plugins/lsp.lua;
        "nvim/lua/d-rens/plugins/orgmode.lua".source = ../configs/nvim/lua/d-rens/plugins/orgmode.lua;
        "nvim/lua/d-rens/plugins/snippets.lua".source = ../configs/nvim/lua/d-rens/plugins/snippets.lua;
        "nvim/lua/d-rens/plugins/telescope.lua".source = ../configs/nvim/lua/d-rens/plugins/telescope.lua;
        "nvim/lua/d-rens/plugins/theme.lua".source = ../configs/nvim/lua/d-rens/plugins/theme.lua;
        "nvim/lua/d-rens/plugins/todo.lua".source = ../configs/nvim/lua/d-rens/plugins/todo.lua;
        "nvim/lua/d-rens/plugins/treesitter.lua".source = ../configs/nvim/lua/d-rens/plugins/treesitter.lua;
        "nvim/lua/d-rens/plugins/trouble.lua".source = ../configs/nvim/lua/d-rens/plugins/trouble.lua;
        "nvim/lua/d-rens/plugins/undotree.lua".source = ../configs/nvim/lua/d-rens/plugins/undotree.lua;
        "nvim/lua/d-rens/plugins/vimbegood.lua".source = ../configs/nvim/lua/d-rens/plugins/vimbegood.lua;
        "nvim/lua/d-rens/plugins/vimtex.lua".source = ../configs/nvim/lua/d-rens/plugins/vimtex.lua;
        "nvim/lua/d-rens/plugins/zen.lua".source = ../configs/nvim/lua/d-rens/plugins/zen.lua;
    };
}
