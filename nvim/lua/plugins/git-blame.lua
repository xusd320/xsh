return {
  "f-person/git-blame.nvim",
  event = { "BufRead", "BufNewFile" },
  opts = {
    enabled = true,
    message_template = "<summary> • <date> • <author> • <<sha>>",
    date_format = "%m-%d-%Y %H:%M",
    virtual_text_column = 1,
  },
}
