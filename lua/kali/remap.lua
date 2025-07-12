vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- use C-p/c to paste/copy from clipboard
-- NORMAL mode: copy/paste with leader (e.g. <Space>y)
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true, silent = true }) -- copy
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true, silent = true }) -- paste

-- INSERT mode: paste with Ctrl+Shift+V (if terminal supports it)
vim.keymap.set('i', '<C-S-v>', '<C-r>+', { noremap = true, silent = true })

-- VISUAL mode: use Ctrl+y / Ctrl+p
vim.keymap.set('x', '<C-y>', '"+y', { noremap = true, silent = true }) -- copy to clipboard
vim.keymap.set('x', '<C-p>', '"+p', { noremap = true, silent = true }) -- paste from clipboard


if vim.g.neovide == true then
  vim.api.nvim_set_keymap("n", "<C-1>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end

-- Terminal
vim.keymap.set("n", "<Leader>tt", ":split | resize 10 | terminal")
