require("toggleterm").setup({
  direction = 'float',
  float_opts = {
    border = 'curved',
    width = math.floor(vim.o.columns * 0.8),
    height = math.floor(vim.o.lines * 0.8),
  },
  open_mapping = [[<leader>tt]],
})

-- Add escape key mapping to close toggleterm
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>:ToggleTerm<CR>]], { noremap = true, silent = true })
