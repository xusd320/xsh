lvim.autocommands = {
  {
    "VimEnter",
    {
      pattern = { "*" },
      command = "clearjumps",
    }
  },
  {
    "FileType",
    {
      pattern = "qf",
      command = "wincmd J"
    }
  },
  {
    "FileType",
    {
      pattern = "zsh",
      command = "set filetype=bash"
    }
  }
}