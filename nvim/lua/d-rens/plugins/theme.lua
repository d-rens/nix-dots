return {
    "catppuccin/nvim",
    "ray-x/aurora",
    name = "aurora",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "aurora"
    end,
}
