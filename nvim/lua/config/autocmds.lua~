vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd({ "DirChanged" }, {
  group = augroup("startsyncdirtotmux"),
  pattern = "global",
  command = 'call system("bash ~/xsh/tmux_vim.sh attach")',
})

vim.api.nvim_create_autocmd({ "ExitPre" }, {
  group = augroup("stopsyncdirtotmux"),
  command = 'call system("bash ~/xsh/tmux_vim.sh unattach")',
})
