require("codecompanion").setup({
  extensions = {
    mcphub = {
      callback = "mcphub.extensions.codecompanion",
      opts = {
        make_vars = true,
        make_slash_commands = true,
        show_result_in_chat = true
      }
    }
  }
})
vim.keymap.set("n", "<leader>cc", function()
  vim.cmd("CodeCompanionChat")
end, { desc = "Run CodeCompanionChat via CC" })

vim.keymap.set("n", "<leader>cs", function()
  vim.cmd("CodeCompanionActions")
end, { desc = "Run CodeCompanionActions via CA" })
