function ColorMyPencils(color) 
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    
    vim.cmd([[
        augroup my_color_scheme
        autocmd!
        autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
        autocmd ColorScheme * highlight NonText guibg=NONE ctermbg=NONE
        augroup END
    ]])
end


return {
    {
        "folke/tokyonight.nvim",
        opts = {
            style = "storm",
            transparent = true,
            terminal_colors = true,
            styles = {
                comments = { italic = false },
                keywords = { italic = false },
                sidebars = "dark",
                floats = "dark",
            }
        }
    },
    {
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
            require('rose-pine').setup({
                disable_background = true
            })
            ColorMyPencils()
        end
    },
}
