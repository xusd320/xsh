-- Standard Keymaps
local map = vim.keymap.set

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete Buffer" })
map("n", "<leader>bD", "<cmd>bd!<cr>", { desc = "Delete Buffer (Force)" })

-- Better navigation
map("n", "H", "^", { desc = "Go to start of line" })
map("n", "L", "$", { desc = "Go to end of line" })
map("v", "H", "^", { desc = "Go to start of line" })
map("v", "L", "$", { desc = "Go to end of line" })

-- Keep cursor in place
map("n", "J", "mzJ`z", { desc = "Join lines" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- System Clipboard
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Copy line to system clipboard" })
map({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from system clipboard" })
map({ "n", "v" }, "<leader>P", [["+P]], { desc = "Paste from system clipboard (before)" })

-- Terminal
map("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })

-- Better Indent
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Center search results
map("n", "n", "nzzzv", { desc = "Next search result" })
map("n", "N", "Nzzzv", { desc = "Prev search result" })

-- Reselect last visual selection
map("n", "gv", "`[v`]", { desc = "Reselect last changed text" })

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- Windows
map("n", "<leader>ww", "<c-w>p", { desc = "Other Window" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window" })
map("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below" })
map("n", "<leader>w|", "<C-W>v", { desc = "Split Window Right" })
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })

-- Tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- New File
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- UI
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- UI Toggles
map("n", "<leader>us", function() vim.opt.spell = not(vim.opt.spell:get()) end, { desc = "Toggle Spelling" })
map("n", "<leader>uw", function() vim.opt.wrap = not(vim.opt.wrap:get()) end, { desc = "Toggle Word Wrap" })
map("n", "<leader>uL", function() vim.opt.relativenumber = not(vim.opt.relativenumber:get()) end, { desc = "Toggle Relative Line Numbers" })
map("n", "<leader>ul", function() vim.opt.number = not(vim.opt.number:get()) end, { desc = "Toggle Line Numbers" })
map("n", "<leader>ud", function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end, { desc = "Toggle Diagnostics" })
map("n", "<leader>uc", function()
  local concept = vim.opt.conceallevel:get()
  vim.opt.conceallevel = concept == 0 and 2 or 0
end, { desc = "Toggle Conceal" })

-- Unmap Neovim 0.10 default mappings that interfere with custom 'gr' mappings
pcall(vim.keymap.del, "n", "grn")
pcall(vim.keymap.del, "n", "gra")
pcall(vim.keymap.del, "n", "grr")
pcall(vim.keymap.del, "n", "gri")
pcall(vim.keymap.del, "n", "grt")
pcall(vim.keymap.del, "x", "gra")
