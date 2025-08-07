vim.opt.cmdheight = 1
vim.opt.relativenumber = false
vim.opt.wrap = true
vim.opt.conceallevel = 0

vim.opt.updatetime = 400

vim.opt.ignorecase = false
vim.opt.smartcase = false

vim.opt.backup = true
vim.opt.backupdir = vim.fn.expand("~/.local/state/nvim/backup")
vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.guicursor = {
  "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50",
  "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
  "sm:block-blinkwait175-blinkoff150-blinkon175",
}

vim.g.root_spec = { "cwd" }

vim.g.snacks_animate = false

vim.g.lazyvim_prettier_needs_config = true
