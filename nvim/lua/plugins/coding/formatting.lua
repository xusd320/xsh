return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cF",
      function()
        require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      sh = { "shfmt" },
      javascript = { "biome", "prettier", stop_after_first = true },
      typescript = { "biome", "prettier", stop_after_first = true },
      javascriptreact = { "biome", "prettier", stop_after_first = true },
      typescriptreact = { "biome", "prettier", stop_after_first = true },
      css = { "prettier" },
      html = { "prettier" },
      json = { "biome", "prettier", stop_after_first = true },
      yaml = { "prettier" },
      markdown = { "prettier" },
      rust = { "rustfmt", lsp_format = "fallback" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
    formatters = {
      biome = {
        require_cwd = true,
      },
    },
  },
}
