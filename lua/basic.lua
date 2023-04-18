vim.opt.background = "dark"
vim.opt.spell = true
vim.opt.spelllang = "en"
vim.opt.timeoutlen = 100
vim.opt.ignorecase = false
vim.opt.showmode = true
vim.opt.foldcolumn = '0'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = -1
vim.opt.foldenable = true

vim.g.mapleader = "space"

lvim.colorscheme = "catppuccin"

lvim.log.level = "warn"

lvim.format_on_save.enabled = false

lvim.builtin.lir.active = false

lvim.builtin.alpha.active = false

lvim.builtin.project.active = false

lvim.builtin.terminal.active = true

lvim.builtin.lualine.sections.lualine_b = { { 'filename', path = 1 } }
