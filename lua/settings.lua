-- General settings
vim.opt.number = true             -- Show line numbers
vim.opt.tabstop = 4               -- Set tab width to 4 spaces
vim.opt.shiftwidth = 4            -- Set indent width to 4 spaces
vim.opt.expandtab = true          -- Convert tabs to spaces
vim.cmd('syntax on')              -- Enable syntax highlighting
vim.cmd.colorscheme "xcodedarkhc" -- Set Xcode Dark HC colorscheme
vim.opt.hlsearch = false          -- prevents from search staying after being done
vim.opt.incsearch = true          -- search as you type
-- show spaces
vim.opt.list = true

vim.opt.termguicolors = true
vim.opt.updatetime = 80
vim.api.nvim_set_option("clipboard", "unnamed")
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = { '*' },
  command = 'syntax sync fromstart'
})

-- Make background fully transparent
function SetTransparent()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
  vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
  vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
  vim.api.nvim_set_hl(0, "SpecialKey", { bg = "none" })
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

  -- Bufferline transparency - commented out to keep bufferline opaque
  vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "none" })
  vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "none" })
  vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { bg = "none" })
  vim.api.nvim_set_hl(0, "BufferLineBufferVisible", { bg = "none" })
end

-- Apply transparency after colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    SetTransparent()
  end
})

SetTransparent()
