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

-- vsplit keybinding
vim.api.nvim_set_keymap('n', '<leader>v', ':vsplit<CR>', { noremap = true, silent = true })

-- navigate between splits
vim.api.nvim_set_keymap('n', '<leader>w', '<C-w>w', { noremap = true, silent = true })

-- lazygit keybinding to connect
vim.api.nvim_set_keymap('n', '<leader>lg', ':LazyGit<CR>', { noremap = true, silent = true })
-- exit lazygit via 'q'

-- debuger keybinding to connect/disconnect
vim.api.nvim_set_keymap("n", "<leader>da", ":lua require('dapui').toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>de", ":lua require('dap').terminate(); require('dapui').close()<CR>",
  { noremap = true, silent = true })
-- spacing keybinding
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<CR>")', { expr = true, silent = true, replace_keycodes = false })
-- vim.go.t_Co="256"
