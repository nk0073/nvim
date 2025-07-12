require("kali")

vim.o.guicursor = ""
vim.g.nord_disable_background = true
-- vim.cmd.colorscheme('catppuccin-frappe')
vim.cmd.colorscheme('vscode')
vim.o.background = 'dark'
vim.cmd [[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight CursorLineNr guibg=NONE ctermbg=NONE
]]


-- transparent background
-- function ColorMyPencils(color)
--     color = color or 'gruvbox-material'
--     vim.cmd.colorscheme(color)
--
--     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end
--
-- vim.api.nvim_create_autocmd("VimEnter", {
--     callback = function()
--         ColorMyPencils()
--     end
-- })
--
