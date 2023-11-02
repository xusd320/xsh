vim.opt.background = 'dark'
vim.opt.spell = true
vim.opt.spelllang = 'en'
vim.opt.timeoutlen = 100
vim.opt.ignorecase = false
vim.opt.showmode = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.foldcolumn = '0'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = -1
vim.opt.foldenable = true
vim.opt.backup = true
vim.opt.backupdir = join_paths(get_cache_dir(), 'backup')
-- vim.opt.swapfile = true
vim.opt.directory = join_paths(get_cache_dir(), 'swap')
vim.opt.undofile = true
vim.opt.undodir = join_paths(get_cache_dir(), 'undo')

vim.g.XkbSwitchEnabled = 1
vim.g.XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'

vim.g.tabby_node_binary = vim.fn.expand('~/.nvm/versions/node/v18.18.2/bin/node')
vim.g.tabby_keybinding_accept = '<C-Tab>'
vim.g.tabby_keybinding_trigger_or_dismiss = '<C-_>'

lvim.colorscheme = 'catppuccin'
-- lvim.colorscheme = 'github_dark_dimmed'

lvim.log.level = 'warn'

lvim.format_on_save.enabled = true

lvim.builtin.alpha.active = true

lvim.builtin.lir.active = false

lvim.builtin.project.active = true
lvim.builtin.project.patterns = { '>Projects', '.git' }

lvim.builtin.terminal.active = true

lvim.builtin.lualine.sections.lualine_c = { { 'filename', path = 1 } }

lvim.builtin.gitsigns.opts.current_line_blame = true
lvim.builtin.gitsigns.opts.current_line_blame_opts.delay = 200
