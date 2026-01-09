-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- UI
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.cmdheight = 0 -- Hide command line when not in use
vim.opt.wrap = false
vim.opt.conceallevel = 2
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.showmode = false
vim.opt.laststatus = 3
vim.opt.showtabline = 2
vim.opt.smoothscroll = true -- Enable smooth scrolling
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.winminwidth = 5

-- Behavior
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen"
vim.opt.confirm = true
vim.opt.updatetime = 100 -- Increase responsiveness for CursorHold, diagnostic popups
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 0 -- Faster response for escape and key codes
vim.opt.virtualedit = "block"
vim.opt.inccommand = "nosplit"
vim.opt.autowrite = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.formatoptions = "jcroqlnt"
vim.opt.undofile = true -- Enable persistent undo
vim.opt.undolevels = 10000
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Smart case search
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftround = true -- Round indent
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = false
vim.opt.smartcase = false
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"

-- Backup/Undo
vim.opt.backup = true
local backupdir = vim.fn.expand("~/.local/state/nvim/backup")
vim.opt.backupdir = backupdir
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undolevels = 10000

-- Session
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

-- Ensure backup dir exists
if vim.fn.isdirectory(backupdir) == 0 then
  vim.fn.mkdir(backupdir, "p")
end
