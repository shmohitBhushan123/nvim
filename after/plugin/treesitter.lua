require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "javascript", "go", "bash", "typescript", "groovy" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
  highlight = {
    enable = true,
    disable = {}
    -- disable = function(lang, buf)
    --   local max_filesize = 2 * 1024 * 1024 -- 2 MB
    --   local ok, stats = pcall(function()
    --     local filename = vim.api.nvim_buf_get_name(buf)
    --     if filename == "" then return nil end
    --     return vim.loop.fs_stat(filename)
    --   end)
    --   if ok and stats and stats.size and stats.size > max_filesize then
    --     return true
    --   end
    --   return false
    -- end,
  }
}
