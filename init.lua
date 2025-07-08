require("kali")

vim.cmd [[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
]]

vim.o.guicursor = ""
vim.g.nord_disable_background = true
vim.cmd.colorscheme('default')

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
