return {
  "mrcjkb/rustaceanvim",
  config = function(_, opts)
    local codelldb = vim.fn.exepath("codelldb")
    local codelldb_lib_ext = io.popen("uname"):read("*l") == "Linux" and ".so" or ".dylib"
    local library_path = vim.fn.expand("$MASON/opt/lldb/lib/liblldb" .. codelldb_lib_ext)
    opts.dap = {
      adapter = require("rustaceanvim.config").get_codelldb_adapter(codelldb, library_path),
    }
    
    vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
    if vim.fn.executable("rust-analyzer") == 0 then
      vim.notify(
        "**rust-analyzer** not found in PATH, please install it.\nhttps://rust-analyzer.github.io/",
        vim.log.levels.ERROR,
        { title = "rustaceanvim" }
      )
    end
  end,
  opts = {
    server = {
      cmd = { "rust-analyzer" },
      default_settings = {
        ["rust-analyzer"] = {
          cachePriming = {
            enable = false,
          },
          cargo = {
            allFeatures = false,
            allTargets = false,
            target = vim.fn.environ().RA_TARGET,
            targetDir = true,
          },
          check = {
            command = "clippy",
            extraArgs = { "--no-deps" },
          },
          checkOnSave = true,
          completion = {
            fullFunctionSignatures = true,
          },
          diagnostics = {
            enable = true,
          },
          files = {
            watcher = "client",
          },
          procMacro = {
            enable = true,
            ignored = {
              ["async-trait"] = { "async_trait" },
              ["napi-derive"] = { "napi" },
              ["async-recursion"] = { "async_recursion" },
            },
          },
        },
      },
    },
  },

  keys = {
    {
      "gm",
      function()
        vim.cmd.RustLsp("expandMacro")
      end,
      desc = "Expand rust macros",
    },
  },
}
