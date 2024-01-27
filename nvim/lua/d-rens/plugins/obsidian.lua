return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  keys = {
      {"<leader>os", "<cmd>ObsidianSearch<cr>", desc = "test" },
      {"<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", desc = "test" },
      {"<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "test" },
      {"<leader>ol", "<cmd>ObsidianLink<cr>", desc = "test" },
      {"<leader>of", "<cmd>ObsidianFollowLink<cr>", desc = "test" },
      {"<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "test" },
      {"<leader>ot", "<cmd>ObsidianTags<cr>", desc = "test" },
      {"<leader>oT", "<cmd>ObsidianTemplate<cr>", desc = "test" },
      --{"<leader>o", "<cmd>Obsidian<cr>", desc = "test" },
      --{"<leader>o", "<cmd>Obsidian<cr>", desc = "test" },
      -- add the rest
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/files/obsidian",
      },
    },
  },
}
