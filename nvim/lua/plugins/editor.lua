return {
  -- Hop: jump to any word/line/pattern
  -- phaazon/hop.nvim is archived; smoka7/hop.nvim is the maintained fork
  {
    "smoka7/hop.nvim",
    version = "*",
    event = "BufReadPost",
    opts = {
      keys = "etovxqpdygfblzhckisuran",
      jump_on_sole_occurrence = false,
    },
  },

  -- Better escape: jk / kj to exit insert mode
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup({
        timeout = vim.o.timeoutlen,
        default_mappings = false,
        mappings = {
          i = {
            j = { k = "<Esc>" },
            k = { j = "<Esc>" },
          },
          c = {
            j = { k = "<C-c>" },
            k = { j = "<C-c>" },
          },
        },
      })
    end,
  },

  -- Spectre: project-wide find & replace
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Spectre",
  },

  -- Outline: symbols overview (replaces archived symbols-outline.nvim)
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    opts = {
      outline_window = {
        position = "left",
        width = 35,
        wrap = false,
      },
      keymaps = {
        fold = "h",
        unfold = "l",
        fold_all = "zM",
        unfold_all = "zR",
      },
    },
  },

  -- Undotree: visualize undo history
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },

  -- Tmux navigator: seamless navigation between vim splits and tmux panes
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
    },
    keys = {
      { "<c-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate Left" },
      { "<c-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate Down" },
      { "<c-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate Up" },
      { "<c-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate Right" },
    },
  },

  -- vim-abolish: case coercion and substitution (crc = camelCase, crm = MixedCase, etc.)
  { "tpope/vim-abolish" },

  -- Extended % matching
  { "andymass/vim-matchup", event = "BufReadPost" },

  -- Telescope: override defaults for vertical layout
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = {
          "^./.git/",
          "^./target/",
          "LICENSE*",
        },
        layout_strategy = "vertical",
        layout_config = { height = 0.95, width = 0.95 },
      },
    },
  },
}
