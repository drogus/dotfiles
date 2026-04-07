return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      -- "vimdoc" replaces the old "help" parser name
      -- "go" replaces the old "golang" parser name
      ensure_installed = {
        "bash",
        "c",
        "elixir",
        "go",
        "gomod",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "python",
        "ruby",
        "rust",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      -- Use pre-compiled parsers instead of compiling with tree-sitter-cli.
      -- tree-sitter-cli is NOT available in Mason's registry; install via:
      --   brew install tree-sitter
      -- if you ever need to compile parsers from source.
    },
  },
}
