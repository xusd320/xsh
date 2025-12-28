-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- UI
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8
vim.opt.cmdheight = 1
vim.opt.wrap = true
vim.opt.conceallevel = 0

-- Behavior
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.confirm = true
vim.opt.updatetime = 400

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = false
vim.opt.smartcase = false
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"

-- Backup/Undo
vim.opt.backup = true
vim.opt.backupdir = vim.fn.expand("~/.local/state/nvim/backup")
vim.opt.swapfile = false
vim.opt.undofile = true

-- Ensure backup dir exists
if vim.fn.isdirectory(vim.opt.backupdir:get()) == 0 then
  vim.fn.mkdir(vim.opt.backupdir:get(), "p")
end
