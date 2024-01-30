return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "SirVer/ultisnips",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    "micangl/cmp-vimtex",
    "neovim/nvim-lspconfig",
    "quangnguyen30192/cmp-nvim-ultisnips",
  },

  opts = function()
    -- begin ultisnips
    vim.g.UltiSnipsExpandTrigger="<tab>"
    vim.g.UltiSnipsJumpForwardTrigger="<C-n>"
    vim.g.UltiSnipsJumpBackwardTrigger="<C-b>"
    -- end ultisnips
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local defaults = require("cmp.config.default")()
    return {
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        --["<C-b>"] = cmp.mapping.scroll_docs(-4),
        --["<C-f>"] = cmp.mapping.scroll_docs(4),
        --["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<S-CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path" },
      }, {
        { name = "buffer" },
      }),
      sorting = defaults.sorting,
    }
  end,
  ---@param opts cmp.ConfigSchema
  config = function(_, opts)
    for _, source in ipairs(opts.sources) do
      source.group_index = source.group_index or 1
    end
    require("cmp").setup(opts)
    require('cmp').setup({
      sources = {
        { name = 'vimtex', 'ultisnips', },
      },
    })
        
  end,
}
