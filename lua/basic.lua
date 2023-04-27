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
vim.opt.backup = true
vim.opt.swapfile = true

vim.g.mapleader = "space"

lvim.colorscheme = "catppuccin"

lvim.log.level = "warn"

lvim.format_on_save.enabled = false

lvim.builtin.alpha.active = true

lvim.builtin.lir.active = false

lvim.builtin.project.active = false

lvim.builtin.terminal.active = true

lvim.builtin.lualine.sections.lualine_b = { { "filename", path = 1 } }