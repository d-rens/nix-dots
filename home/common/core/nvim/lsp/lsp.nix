{
  programs.nixvim = {
    plugins = {
      lsp-format = {
        enable = false; # Enable it if you want lsp-format integration for none-ls
      };
      fidget = {
        enable = true;
        logger = {
          level = "warn"; # “off”, “error”, “warn”, “info”, “debug”, “trace”
            floatPrecision = 0.01; # Limit the number of decimals displayed for floats
        };
      };
      lsp = {
        enable = true;
        capabilities = "offsetEncoding =  'utf-16'";
        servers = {
          clangd = {enable = true;};
          texlab = {enable = true;};
          lua-ls = {
            enable = true;
            extraOptions = {
              settings = {
                Lua = {
                  completion = {
                    callSnippet = "Replace";
                  };
                  telemetry = {
                    enabled = false;
                  };
                  hint = {enable = true;};
                };
              };
            };
          };
          nil-ls = {enable = true;};
        };
      };
    };
    #extraConfigLua = ''
    #  local _border = "rounded"

    #  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    #      vim.lsp.handlers.hover, {
    #      border = _border
    #      }
    #      )

    #  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    #      vim.lsp.handlers.signature_help, {
    #      border = _border
    #      }
    #      )

    #  vim.diagnostic.config{
    #    float={border=_border}
    #  };

    #require('lspconfig.ui.windows').default_options = {
    #  border = _border
    #}
    #'';
  };
}
