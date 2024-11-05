-- General settings
vim.opt.number = true         -- Show line numbers
vim.opt.tabstop = 4           -- Set tab width to 4 spaces
vim.opt.shiftwidth = 4        -- Set indent width to 4 spaces
vim.opt.expandtab = true      -- Convert tabs to spaces
vim.cmd('syntax on')          -- Enable syntax highlighting
vim.cmd.colorscheme "catppuccin"  -- Set colorscheme
vim.opt.hlsearch = false      -- prevents from search staying after being done
vim.opt.incsearch = true      -- search as you type

vim.opt.termguicolors = true
vim.opt.updatetime = 80

function SetTransparent()
    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end 

SetTransparent()
