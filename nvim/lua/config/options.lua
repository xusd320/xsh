vim.opt.background = "dark"
vim.opt.spell = true
vim.opt.spelllang = "en"
vim.opt.timeoutlen = 100
vim.opt.ignorecase = false
vim.opt.showmode = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = -1
vim.opt.foldenable = true
vim.opt.relativenumber = false
vim.opt.backup = true
vim.opt.backupdir = vim.fn.expand("~/.local/state/nvim/backup")
vim.opt.swapfile = false
vim.opt.undofile = false

vim.g.XkbSwitchEnabled = 1
vim.g.XkbSwitchLib = "/usr/local/lib/libInputSourceSwitcher.dylib"

vim.g.tabby_node_binary = vim.fn.expand("~/.nvm/versions/node/v18.18.2/bin/node")
