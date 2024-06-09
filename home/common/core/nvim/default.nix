{ config, pkgs, ...}:

{
    home.packages = with pkgs; [
      #neovim # already declared as system package
      gcc # for treesitter
      gh
      ripgrep # for telescope
    ];
    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    xdg.configFile = {
        "nvim/init.lua".source = ./src/init.lua;
        "nvim/after/ftplugin/markdown.lua".source = ./src/after/ftplugin/markdown.lua;
        "nvim/lua/d-rens/init.lua".source = ./src/lua/d-rens/init.lua;
        "nvim/lua/d-rens/lazy/init.lua".source = ./src/lua/d-rens/lazy/init.lua;
        "nvim/lua/d-rens/lazy/keymaps.lua".source = ./src/lua/d-rens/lazy/keymaps.lua;
        "nvim/lua/d-rens/lazy/options.lua".source = ./src/lua/d-rens/lazy/options.lua;
        "nvim/lua/d-rens/lazy/setuplazy.lua".source = ./src/lua/d-rens/lazy/setuplazy.lua;
        "nvim/lua/d-rens/plugins/colorizer.lua".source = ./src/lua/d-rens/plugins/colorizer.lua;   
        "nvim/lua/d-rens/plugins/git.lua".source = ./src/lua/d-rens/plugins/git.lua;
        "nvim/lua/d-rens/plugins/harpoon.lua".source = ./src/lua/d-rens/plugins/harpoon.lua;
        "nvim/lua/d-rens/plugins/img-clip.lua".source = ./src/lua/d-rens/plugins/img-clip.lua;
        "nvim/lua/d-rens/plugins/lsp.lua".source = ./src/lua/d-rens/plugins/lsp.lua;
        "nvim/lua/d-rens/plugins/oil.lua".source = ./src/lua/d-rens/plugins/oil.lua;
        "nvim/lua/d-rens/plugins/orgmode.lua".source = ./src/lua/d-rens/plugins/orgmode.lua;
        "nvim/lua/d-rens/plugins/snippets.lua".source = ./src/lua/d-rens/plugins/snippets.lua;
        "nvim/lua/d-rens/plugins/telescope.lua".source = ./src/lua/d-rens/plugins/telescope.lua;
        "nvim/lua/d-rens/plugins/theme.lua".source = ./src/lua/d-rens/plugins/theme.lua;
        "nvim/lua/d-rens/plugins/todo.lua".source = ./src/lua/d-rens/plugins/todo.lua;
        "nvim/lua/d-rens/plugins/treesitter.lua".source = ./src/lua/d-rens/plugins/treesitter.lua;
        "nvim/lua/d-rens/plugins/trouble.lua".source = ./src/lua/d-rens/plugins/trouble.lua;
        "nvim/lua/d-rens/plugins/undotree.lua".source = ./src/lua/d-rens/plugins/undotree.lua;
        "nvim/lua/d-rens/plugins/vimbegood.lua".source = ./src/lua/d-rens/plugins/vimbegood.lua;
        "nvim/lua/d-rens/plugins/vimtex.lua".source = ./src/lua/d-rens/plugins/vimtex.lua;
        "nvim/lua/d-rens/plugins/zen.lua".source = ./src/lua/d-rens/plugins/zen.lua;
    };
}
