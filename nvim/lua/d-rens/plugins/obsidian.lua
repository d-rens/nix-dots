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
      {"<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Searching vault" },
      {"<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick switching throught vault" },
      {"<leader>or", "<cmd>ObsidianRename<cr>", desc = "Renames the file" },
      {"<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Opens the file in obsidian" },
      {"<leader>ol", "<cmd>ObsidianLink<cr>", desc = "Links in obsidian" },
      {"<leader>of", "<cmd>ObsidianFollowLink<cr>", desc = "Follows the link" },
      {"<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Shows the backlinks" },
      {"<leader>ot", "<cmd>ObsidianTags<cr>", desc = "Tags the file" },
      {"<leader>oT", "<cmd>ObsidianTemplate<cr>", desc = "Adds a template one chooses" },
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
