return {
  -- Lualine customization
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto",
        fmt = string.lower,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
    },
  },

  -- Trouble: diagnostics panel
  {
    "folke/trouble.nvim",
    opts = {
      position = "right",
      width = 75,
      padding = true,
      auto_preview = false,
    },
  },

  -- Fidget: LSP progress notifications
  {
    "j-hui/fidget.nvim",
    opts = {},
  },

  -- Neo-tree: file explorer (LazyVim default, replacing nvim-tree)
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, -- show dotfiles
          hide_gitignored = false,
        },
        follow_current_file = { enabled = true },
      },
      default_component_configs = {
        git_status = {
          symbols = {
            added = "A",
            modified = "M",
            deleted = "D",
            renamed = "R",
            untracked = "U",
            ignored = "I",
            unstaged = "-",
            staged = "S",
            conflict = "C",
          },
        },
      },
    },
  },
}
