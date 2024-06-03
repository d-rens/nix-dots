return {
    "folke/trouble.nvim",
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, 
    -- uncomment and set icons true below to enable icons.
    opts = {
        icons = false
    },
    keys = {
        {
            "<leader>tt",
            function()
                require("trouble").toggle()
            end
        },
        {
            "<leader>tn",
            function()
                require("trouble").next({
                    skip_groups = true,
                    jump = true
                })
            end
        },
    { 
        "<leader>tp",
        function()
            require("trouble").previous({
                skip_groups = true,
                jump = true
            })
        end
    }
}
}
