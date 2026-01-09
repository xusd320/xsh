return {
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    ft = { "rust" },
    opts = {
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>cR", function()
            vim.cmd.RustLsp("codeAction")
          end, { desc = "Code Action (Rust)", buffer = bufnr })
          vim.keymap.set("n", "<leader>dr", function()
            vim.cmd.RustLsp("debuggables")
          end, { desc = "Rust Debuggables", buffer = bufnr })
          vim.keymap.set("n", "gm", function()
            vim.cmd.RustLsp("expandMacro")
          end, { desc = "Expand Macro", buffer = bufnr })
        end,
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
            hover = {
              memoryLayout = {
                enabled = true,
                niches = true,
              },
              documentation = {
                enabled = false,
              },
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
    config = function(_, opts)
      local extension_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb"
      local this_os = io.popen("uname -s"):read("*l")

      if this_os:find("Linux") then
        liblldb_path = liblldb_path .. ".so"
      else
        liblldb_path = liblldb_path .. ".dylib"
      end

      local cfg = require("rustaceanvim.config")
      opts.dap = {
        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
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
  },
  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {
      completion = {
        crates = {
          enabled = true,
        },
      },
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },
}
