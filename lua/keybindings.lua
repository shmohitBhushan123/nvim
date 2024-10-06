-- ~/.config/nvim/lua/config/keybindings.lua

-- Accelerated-jk keybindings
vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {})
vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {})

-- -- Nvim-tree keybinding
vim.api.nvim_set_keymap('n', '<C-o>', ':NvimTreeOpen<CR>', { noremap = true, silent = true })

-- Bufferline navigation
vim.api.nvim_set_keymap('n', '<leader>bn', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bp', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- Telescope keybindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.api.nvim_set_keymap('n', ':f', ':Telescope find_files<CR>', { noremap = true, silent = true })

