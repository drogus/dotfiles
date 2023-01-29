return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'andymass/vim-matchup' -- extended matching with %
  use 'simrat39/symbols-outline.nvim' -- symbols view
  -- better folds
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
  use "max397574/better-escape.nvim" -- faster jj / kshadowk

  -- color themes
  use "ellisonleao/gruvbox.nvim"
  use "sainnhe/sonokai"
  use "sainnhe/gruvbox-material"
  use "overcache/NeoSolarized"
  use "folke/tokyonight.nvim"
  use 'navarasu/onedark.nvim'
  use 'altercation/vim-colors-solarized'
  use 'Shatur/neovim-ayu'
  use 'rakr/vim-one'
  use 'EdenEast/nightfox.nvim'

  use { 'kyazdani42/nvim-tree.lua', -- Filesystem navigation
    requires = 'kyazdani42/nvim-web-devicons' } -- Filesystem icons
  use { 'nvim-lualine/lualine.nvim', -- Statusline
    requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use {
    "windwp/nvim-autopairs", -- Autocomplete (), {}, []
    config = function() require("nvim-autopairs").setup {} end
  }
  use 'lewis6991/impatient.nvim' -- Makes neovim faster
  use 'tpope/vim-surround'
  use { 'phaazon/hop.nvim', branch = 'v2' } -- Navitage to any word in the file
  use 'onsails/lspkind.nvim' -- shows icons in cmp
  use 'j-hui/fidget.nvim' -- sho status of nvim-lsp progress
  use 'RRethy/vim-illuminate' -- Highlight other uses of word under cursor
  use "lukas-reineke/indent-blankline.nvim" -- ident lines
  use 'numToStr/Comment.nvim' -- Enable comments
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- Make telescope faster
  use 'nvim-telescope/telescope.nvim' -- Fuzzy finder
  use 'BurntSushi/ripgrep' -- Telescope grep
  use 'sharkdp/fd' -- Finder
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip' -- Snippet completion source for nvim-cmp
  use 'simrat39/rust-tools.nvim' -- rust-analyzer hints and more!
  use 'saecki/crates.nvim' -- Help managing crates dependencies
  use 'hrsh7th/vim-vsnip' -- Snippet engine
  use 'nvim-lua/popup.nvim' -- Poup for telescope
  use('nvim-treesitter/nvim-treesitter', { run = ":TSUpdate" })
  use 'm-demare/hlargs.nvim' -- Highlight argument definitions and usages
  use 'nvim-lua/plenary.nvim' -- Collection of Lua functions
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use { 'theHamsta/nvim-dap-virtual-text' }
  use 'christoomey/vim-tmux-navigator'
  use 'hrsh7th/cmp-cmdline'
  use 'nvim-pack/nvim-spectre'
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "jfpedroza/neotest-elixir",
      "rouge8/neotest-rust",
      "olimorris/neotest-rspec"
    }
  }
  use "mbbill/undotree"
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }
end)
