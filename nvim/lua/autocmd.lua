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
  },
  {
    "BufEnter",
    {
      pattern = "*",
      command = "call system('bash ~/xsh/tmux_vim.sh attach')"
    }
  },
  {
    "QuitPre",
    {
      pattern = "*",
      command = "call system('bash ~/xsh/tmux_vim.sh unattach')"
    }
  }
}