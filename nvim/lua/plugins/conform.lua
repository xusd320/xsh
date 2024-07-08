local function biome_lsp_or_prettier(bufnr)
  local has_biome = vim.fs.find({
    "biome.json",
  }, { upward = true })[1]

  if has_biome then
    return { "biome" }
  end

  return { "prettier" }
end

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["javascript"] = biome_lsp_or_prettier,
        ["javascriptreact"] = biome_lsp_or_prettier,
        ["typescript"] = biome_lsp_or_prettier,
        ["typescriptreact"] = biome_lsp_or_prettier,
        ["json"] = biome_lsp_or_prettier,
        ["jsonc"] = biome_lsp_or_prettier,
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "biome",
      },
    },
  },
}
