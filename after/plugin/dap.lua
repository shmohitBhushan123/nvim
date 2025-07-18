-- useful artical about dap : https://github.com/mfussenegger/nvim-dap/issues/20#issuecomment-694290302
local dap = require('dap')
local dapgo = require('dap-go')

-- Setup dap-go (Go-specific defauly dap adapter)
-- if there was no dap-go, you would have to have a dap.adapters.go config 
dapgo.setup()

-- Setup general DAP configuration
dap.set_log_level('INFO')

-- defaults our confiuration to launch.json, otherwise an optional dap.configurations.go would be used to build the payload
require('dap.ext.vscode').load_launchjs()

-- Set breakpoint sign
vim.fn.sign_define('DapBreakpoint', { text = '🗿', texthl = '', linehl = '', numhl = '' })
-- Keybinding to toggle breakpoints
vim.api.nvim_set_keymap('n', '<Leader>db', ':lua require"dap".toggle_breakpoint()<CR>', { noremap = true, silent = true })
-- 5. Key mappings (Optional, for convenience)
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set('n', '<Leader>du', function() require('dapui').toggle() end)
