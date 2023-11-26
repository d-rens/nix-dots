vim.api.nvim_set_keymap('i', '<tab>', 'v:lua.require("my_module").expand_snippet()', { expr = true })
vim.api.nvim_set_keymap('i', '<c-b>', 'v:lua.require("my_module").jump_forward()', { expr = true })
vim.api.nvim_set_keymap('i', '<c-z>', 'v:lua.require("my_module").jump_backward()', { expr = true })
