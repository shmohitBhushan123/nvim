require'nvim-tree'.setup {
    filters = { dotfiles = false },
    update_cwd = true,
    disable_netrw = true,
    hijack_netrw = true,
    git = { enable = true, ignore = false },
    view = { width = 30, side = 'left' },
}
-- Nvim-tree keybinding
vim.api.nvim_set_keymap('n', '<C-o>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

