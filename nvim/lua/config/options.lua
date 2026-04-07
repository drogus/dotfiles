-- Options are automatically loaded before lazy.nvim startup
local opt = vim.opt

-- Tabs / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Line Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 4

-- UI
opt.cursorline = true
opt.cursorlineopt = "number"
opt.scrolloff = 4
opt.signcolumn = "yes"
opt.termguicolors = true
opt.visualbell = true
opt.background = "dark"

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- File handling
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.vim/backups")

-- Misc
opt.history = 1000
opt.autoread = true
opt.spelllang = { "en_us" }
opt.updatetime = 350

-- Create undo directory if needed
vim.fn.mkdir(vim.fn.expand("~/.vim/backups"), "p")
