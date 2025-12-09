return {
  {
    "yetone/avante.nvim",
    build = "make BUILD_FROM_SOURCE=true",
    opts = {
      provider = "gemini-cli",
    },
  },
}
