return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "biome",
        "codelldb",
        "css-lsp",
        "cssmodules-language-server",
        "dot-language-server",
        "eslint-lsp",
        "fixjson",
        "html-lsp",
        "js-debug-adapter",
        "json-lsp",
        "lua-language-server",
        "markdown-toc",
        "markdownlint-cli2",
        "marksman",
        "prettier",
        "shfmt",
        "stylelint",
        "stylua",
        "taplo",
        "typos-lsp",
        "vim-language-server",
        "vtsls",
        "yaml-language-server",
      },
    },
  },
}

-- lua vim.fn.setreg("+", vim.inspect(vim.tbl_map(function(pkg) return pkg.name end, require("mason-registry").get_installed_packages())))
