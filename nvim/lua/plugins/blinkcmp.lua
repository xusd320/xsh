return {
  {
    "saghen/blink.cmp",
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
            enabled = false,
          },
        },
      },
      sources = {
        default = { "dictionary" },
        providers = {
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
        },
      },
    },
  },
}
