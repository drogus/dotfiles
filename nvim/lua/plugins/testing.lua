return {
  -- Neotest: add language-specific test adapters on top of lazyvim.plugins.extras.test.core
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
      "olimorris/neotest-rspec",
      "rouge8/neotest-rust",
      "jfpedroza/neotest-elixir",
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      vim.list_extend(opts.adapters, {
        require("neotest-python"),
        require("neotest-rspec"),
        require("neotest-rust"),
        require("neotest-elixir"),
      })
    end,
  },
}
