-- ~/.config/nvim/lua/config/keybindings.lua
vim.g.mapleader = " "
-- Accelerated-jk keybindings
vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {})
vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {})

-- -- Nvim-tree keybinding
vim.api.nvim_set_keymap('n', '<C-o>', ':NvimTreeOpen<CR>', { noremap = true, silent = true })

-- Bufferline navigation
vim.api.nvim_set_keymap('n', '<leader>nn', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>mm', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

