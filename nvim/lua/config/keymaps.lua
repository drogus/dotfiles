-- Keymaps are automatically loaded on the VeryLazy event
local map = vim.keymap.set

-- Splits (use vv/ss shortcuts instead of <leader>v/s to avoid conflicting
-- with LazyVim's <leader>s search namespace)
map("n", "vv", "<cmd>vsp<cr>", { desc = "Vertical Split" })
map("n", "ss", "<cmd>sp<cr>", { desc = "Horizontal Split" })

-- Save
map({ "n", "v", "i" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Hop navigation
map("n", "HH", "<cmd>HopWord<cr>", { desc = "Hop Word" })
map("n", "HF", "<cmd>HopPattern<cr>", { desc = "Hop Pattern" })
map("n", "HL", "<cmd>HopLineStart<cr>", { desc = "Hop Line Start" })

-- Telescope
map("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
map("n", "<leader>b", function()
  require("telescope.builtin").buffers({ sort_lastused = true, ignore_current_buffer = true })
end, { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
map("n", "<leader>fws", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Workspace Symbols" })
map("n", "<leader>fi", "<cmd>Telescope lsp_implementations<cr>", { desc = "Implementations" })
map("n", "<leader>fl", "<cmd>Telescope treesitter<cr>", { desc = "Treesitter Symbols" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
map("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "Commands" })
map("n", "<leader>fch", "<cmd>Telescope command_history<cr>", { desc = "Command History" })
map("n", "<leader>fsh", "<cmd>Telescope search_history<cr>", { desc = "Search History" })
map("n", "<leader>fmp", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages" })
map("n", "<leader>fgc", "<cmd>Telescope git_commits<cr>", { desc = "Git Commits" })
map("n", "<leader>fgb", "<cmd>Telescope git_branches<cr>", { desc = "Git Branches" })

-- LSP
-- Note: LazyVim sets K=hover, gr=references, gd=definition, gi=implementation
map("n", "<c-]>", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "gn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
map("n", "gs", vim.lsp.buf.document_symbol, { desc = "Document Symbols" })
map("n", "gw", vim.lsp.buf.workspace_symbol, { desc = "Workspace Symbols" })
map("n", "ff", vim.lsp.buf.format, { desc = "Format Buffer" })
map("n", "<leader>ff", vim.lsp.buf.format, { desc = "Format Buffer" })
map("n", "g[", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
map("n", "g]", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

-- File explorer (Neo-tree)
-- <leader>e is LazyVim's default for neo-tree; <leader>nt is an alias
map("n", "<leader>nt", "<cmd>Neotree toggle<cr>", { desc = "Toggle File Explorer" })

-- Symbols outline
map("n", "<leader>tt", "<cmd>Outline<cr>", { desc = "Toggle Symbols Outline" })

-- Comment toggle using built-in gc operator (works with ts-comments.nvim)
map("n", "<C-_>", "gcc", { remap = true, desc = "Toggle Comment Line" })
map("x", "<C-_>", "gc", { remap = true, desc = "Toggle Comment" })

-- DAP
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", function() require("dap").continue() end, { desc = "DAP Continue" })
map("n", "<leader>do", function() require("dap").step_over() end, { desc = "Step Over" })
map("n", "<leader>di", function() require("dap").step_into() end, { desc = "Step Into" })
map("n", "<leader>dr", function() require("dap").repl.open() end, { desc = "DAP REPL" })

-- Spectre (find & replace)
map("n", "<leader>S", function() require("spectre").open() end, { desc = "Open Spectre" })
map("n", "<leader>sw", function() require("spectre").open_visual({ select_word = true }) end, { desc = "Spectre Current Word" })
map("x", "<leader>sv", function() require("spectre").open_visual() end, { desc = "Spectre Visual Selection" })
map("n", "<leader>sp", function() require("spectre").open_file_search() end, { desc = "Spectre Current File" })
