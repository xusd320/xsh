-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- UI
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8 -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8
vim.opt.cmdheight = 1
vim.opt.wrap = false -- No wrap for code is generally better
vim.opt.conceallevel = 2 -- Hide *markup* for bold and italic, but not markers with substitutions
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.showmode = false -- Dont show mode since we have a statusline
vim.opt.laststatus = 3 -- Global statusline
vim.opt.showtabline = 2 -- Always show tabline
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.winminwidth = 5 -- Minimum window width

-- Behavior
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen" -- Reduce jumpiness when splitting
vim.opt.confirm = true
vim.opt.hidden = true -- Enable modified buffers in background
vim.opt.updatetime = 200 -- Faster completion (4000ms default)
vim.opt.timeoutlen = 300 -- Faster key sequence completion
vim.opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
vim.opt.inccommand = "nosplit" -- preview incremental substitute
vim.opt.autowrite = true -- Auto write buffer when it's not the current buffer
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.formatoptions = "jcroqlnt" -- tcqj

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
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
