return {
        "SirVer/ultisnips",
        keys = {
            {"<tab>", vim.cmd.UltiSnipsExpandTrigger},
            {"<C-u>", vim.cmd.UltiSnipsEdit},
            {"<C-n>", vim.cmd.UltiSnipsJumpForwardTrigger,
            {"<C-b>", vim.cmd.UltiSnipsJumpBackwardTrigger},
        }
    }
}
