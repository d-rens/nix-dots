{
  pkgs,
  config,
  lib,
  ...
}:
{
  programs.nixvim = {
      opts = {
        completeopt = ["menuone" "noselect" "noinsert"]; # mostly just for cmp
        cursorline = true; # Highlight the line where the cursor is located
        encoding = "utf-8";
        expandtab = true;
        fileencoding = "utf-8";
        foldcolumn = "0";
        foldenable = true;
        foldlevel = 99;
        foldlevelstart = 99;
        grepformat = "%f:%l:%c:%m";
        grepprg = "rg --vimgrep";
        hlsearch = true;
        ignorecase = true;
        incsearch = true;
        list = true; # Show invisible characters (tabs, eol, ...)
        listchars = "tab:|->,lead:·,space: ,trail:•,extends:→,precedes:←,nbsp:␣";
        number = true;
        relativenumber = true;
        scrolloff = 8;
        shiftwidth = 2;
        showtabline = 2;
#       smartindent = true;
        softtabstop = 2;
        splitbelow = true;
        splitright = true;
        swapfile = false;
        tabstop = 2;
        termguicolors = true;
        timeoutlen = 200;
        undofile = true;
        updatetime = 50; # faster completion (4000ms default)
        wrap = true;
#       backup = false;
#       breakindent = true;
#       cmdheight = 2;
#       colorcolumn = "80";
#       mouse = "a"; # Mouse
#       pumheight = 0;
#       showmode = false;
#       signcolumn = "yes";
#       smartcase = true; # Don't ignore case with capitals
      };
  };
}
