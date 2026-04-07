return {
  -- LSP server configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ruby: solargraph + sorbet
        solargraph = {},
        sorbet = {},
        -- Markdown
        marksman = {},
        -- Go (also configured by lazyvim.plugins.extras.lang.go)
        gopls = {},
        -- Lua (lua_ls replaced the old sumneko_lua)
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
      },
    },
  },

  -- Mason: package manager UI customization
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "",
          package_pending = "",
          package_uninstalled = "",
        },
      },
    },
  },

  -- Diagnostic signs (nvim 0.10+ API)
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.diagnostic.config({
        virtual_text = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
          },
        },
      })
    end,
  },
}
