require("bufferline").setup {
    options = {
        numbers = "buffer_id",
        diagnostics = "nvim_lsp",
        separator_style = "slant",
    },
}
    -- Keybindings for navigating buffers (tabs)
    vim.api.nvim_set_keymap('n', '<leader>bn', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>bp', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
