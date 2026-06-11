local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return
end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier.with({
      prefer_local = "node_modules/.bin",
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "jsonc",
        "yaml",
        "markdown",
        "css",
        "scss",
        "html",
      },
    }),
  },
})
