return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        list = {
          selection = "auto_insert",
        },
        documentation = { auto_show = true },
      },
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
      },
      signature = { enabled = true },
    },
  },
}
