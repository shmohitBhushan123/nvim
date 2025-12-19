require("codecompanion").setup({
  -- Removed mcphub extension - install mcphub if needed
})
vim.keymap.set("n", "<leader>cc", function()
  vim.cmd("CodeCompanionChat")
end, { desc = "Run CodeCompanionChat via CC" })

vim.keymap.set("n", "<leader>cs", function()
  vim.cmd("CodeCompanionActions")
end, { desc = "Run CodeCompanionActions via CA" })
