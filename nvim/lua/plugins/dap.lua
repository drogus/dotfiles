return {
  -- DAP configuration for Ruby and Rust
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
      dap.set_log_level("TRACE")

      -- Ruby debugger via rdbg
      dap.adapters.ruby = function(callback, config)
        callback({
          type = "server",
          host = "127.0.0.1",
          port = "${port}",
          executable = {
            command = "bundle",
            args = {
              "exec",
              "rdbg",
              "-n",
              "--open",
              "--port",
              "${port}",
              "-c",
              "--",
              "bundle",
              "exec",
              config.command,
              config.script,
            },
          },
        })
      end

      dap.configurations.ruby = {
        {
          type = "ruby",
          name = "debug current file",
          request = "attach",
          localfs = true,
          command = "ruby",
          script = "${file}",
        },
        {
          type = "ruby",
          name = "run current spec file",
          request = "attach",
          localfs = true,
          command = "rspec",
          script = "${file}",
        },
        {
          type = "ruby",
          name = "run rails",
          request = "attach",
          localfs = true,
          command = "rails s",
          script = "",
        },
      }

      -- Rust: codelldb adapter (auto-detected from Mason or VS Code extension)
      local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/")
      local vscode_path = vim.fn.expand("~/") .. ".vscode/extensions/vadimcn.vscode-lldb-1.9.2/"

      local dir_exists = function(path)
        local ok, _, code = os.rename(path, path)
        if not ok then
          return code == 13 -- permission denied = exists
        end
        return ok
      end

      local codelldb_base = nil
      if dir_exists(mason_path) then
        codelldb_base = mason_path
      elseif dir_exists(vscode_path) then
        codelldb_base = vscode_path
      end

      if codelldb_base then
        local codelldb_path = codelldb_base .. "adapter/codelldb"
        local liblldb_path = codelldb_base
          .. (vim.fn.has("mac") == 1 and "lldb/lib/liblldb.dylib" or "lldb/lib/liblldb.so")

        if vim.fn.filereadable(codelldb_path) == 1 and vim.fn.filereadable(liblldb_path) == 1 then
          dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
              command = codelldb_path,
              args = { "--liblldb", liblldb_path, "--port", "${port}" },
            },
          }
          dap.adapters.lldb = dap.adapters.codelldb
        end
      end
    end,
  },

  -- DAP UI: automatically open/close on debug events
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup({})
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    end,
  },

  -- DAP virtual text: show variable values inline
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = { commented = true },
  },
}
