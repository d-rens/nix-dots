vim.g.vimtex_view_general_viewer = 'zathura'
vim.g.vimtex_compiler_latexmk_engines = {
  _ = '-xelatex'
}
vim.g.tex_comment_nospell = 1
vim.g.vimtex_compiler_progname = 'nvr'
vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
vim.g.vimtex_quickfix_ignore_filters = {
  'Underfull',
  'Overfull',
  'Negative'
}

vim.api.nvim_set_keymap('i', '<C-f>', '<Esc>:silent exec "!inkscape-figures create \'"..vim.fn.getline(vim.fn.line(\'.\')).."\' \'"..vim.fn.expand(\'%:h\').."/figures/\'"<CR><CR>:w<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-f>', ':silent exec "!inkscape-figures edit \'"..vim.fn.expand(\'%:h\').."/figures/\' > /dev/null 2>&1 &"<CR><CR>:redraw!<CR>', {silent = true})

