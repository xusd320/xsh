return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "codelldb",
        "bash-language-server",
        "lua-language-server",
        "json-lsp",
        "css-lsp",
        "markdown-toc",
        "stylelint",
        "typos-lsp",
        "eslint-lsp",
        "cssmodules-language-server",
        "yaml-language-server",
        "fixjson",
        "html-lsp",
        "prettier",
        "vim-language-server",
        "shfmt",
        "js-debug-adapter",
        "gitui",
        "stylua",
        "marksman",
        "dot-language-server",
        "vtsls",
        "node-debug2-adapter",
        "taplo",
        "markdownlint-cli2",
        "biome",
      },
    },
  },
}

-- lua vim.fn.setreg("+", vim.inspect(vim.tbl_map(function(pkg) return pkg.name end, require("mason-registry").get_installed_packages())))
