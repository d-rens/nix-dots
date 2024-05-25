return {
    "ThePrimeagen/vim-apm",
    config = function()
        local apm = require("vim-apm")
        apm:setup({})

        -- Mapping <leader>apm to toggle the APM monitor
        vim.keymap.set("n", "<leader>apm", function() apm:toggle_monitor() end)
    end
}

