return{
  "lervag/vimtex",
  lazy = false, -- lazy-loading will disable inverse search
  config = function()
    vim.api.nvim_create_autocmd({ "FileType" }, {
      group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
      pattern = { "bib", "tex" },
      callback = function()
        vim.wo.conceallevel = 2
      end,
    })

    vim.g.vimtex_view_method = 'zathura'
    vim.wo.wrap = true
    vim.wo.linebreak = true
    vim.g.vimtex_compiler_latexmk_engines = {
        _ = '-xelatex'
    }
    vim.g.vimtex_compiler_progname = 'nvr'
    vim.g.vimtex_quickfix_ignore_filters = {
      'Underfull',
      'Overfull',
      'Negative'
    }
  end,
}
