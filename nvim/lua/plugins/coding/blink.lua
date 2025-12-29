return {
  "saghen/blink.cmp",
  build = "cargo build --release",
  dependencies = {
    {
      "Kaiser-Yang/blink-cmp-dictionary",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  opts = {
    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
    },
    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer", "dictionary" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
        dictionary = {
          module = "blink-cmp-dictionary",
          name = "Dict",
          min_keyword_length = 3,
          score_offset = -100,
          opts = {
            dictionary_files = {
              "/usr/share/dict/words",
            },
          },
        },
        lsp = { fallbacks = { "dictionary" } },
      },
      per_filetype = {
        codecompanion = { "codecompanion" },
      },
    },
  },
}
