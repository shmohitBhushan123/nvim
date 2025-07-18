-- local lsp = require('lsp-zero')

-- luacheck globals vim
-- local vim = require('vim')
local lspconfig = require('lspconfig')
require("mason").setup()
local capabilities = vim.lsp.protocol.make_client_capabilities()
local util = require('lspconfig/util')
local function on_attach(client, bufnr)
  -- Enable LSP-based keybindings and options for the current buffer
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- Key mappings for LSP
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)          -- Go to definition
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)         -- Go to declaration
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)      -- Go to implementation
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)          -- List references
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)                -- Hover documentation
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)      -- Rename symbol
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts) -- Code actions
  vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format { async = true }
  end, bufopts) -- Format code

  -- Diagnostics navigation
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)         -- Go to previous diagnostic
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)         -- Go to next diagnostic
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts) -- Show diagnostic info

  -- Example: Disable formatting if the server has its own formatting capabilities
  if client.name == "tsserver" or client.name == "jsonls" then
    client.server_capabilities.documentFormattingProvider = false
  end
end
-- Go LSP setup
-- optimal setup for Go
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern({ ".git", "go.mod", "go.work" }),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true, -- Enable unused parameter analysis
        unreachable = true,  -- Enable unreachable code analysis
      },
      staticcheck = true,    -- Enable static check
      usePlaceholders = true,
      completeUnimported = true,
      codelenses = {
        generate = true,
        gc_details = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
      },
    },
  },
}

-- Lua LSP setup
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }, -- Prevent warnings for 'vim' global variable
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- Include runtime files
        checkThirdParty = false,                           -- Disable third-party checks
      },
      telemetry = {
        enable = false, -- Disable telemetry
      },
    },
  },
})
-- Groovy LSP setup
-- lspconfig.groovyls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   cmd = { "groovyls" },
--   filetypes = { "groovy" },
--   root_dir = util.root_pattern({ ".git", "build.gradle", "settings.gradle" }),
-- }

-- Python LSP setuo
lspconfig.pyright.setup {}

-- Ruby LSP setup using solargraph
lspconfig.solargraph.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "solargraph", "stdio" },
  filetypes = { "ruby" },
  root_dir = util.root_pattern({ ".git", "Gemfile", "Rakefile" }),
  settings = {
    solargraph = {
      --get rid of Style warnings
      diagnostics = false,
      autoformatting = true,
      completion = true,
      formatting = true,
      autoformat = true,
      useBundler = true,
      useBundlerPath = true,
      useBundlerGemfile = true,
    }
  },
}

-- lspconfig.sorbet.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   cmd = { "sorbet", "--stdio" },
--   filetypes = { "ruby" },
--   root_dir = util.root_pattern({ ".git", "Gemfile", "sorbet/config" }),
-- }

-- Auto-format on save
vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.groovy lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.lua lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.py lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.js lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.yaml lua vim.lsp.buf.format()]]
-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = false,
})
-- cmp setup
local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
    ['<C-e>'] = cmp.mapping.close(),                   -- Close completion menu
    ['<Down>'] = cmp.mapping.select_next_item(),       -- Select next item
    ['<Up>'] = cmp.mapping.select_prev_item(),         -- Select previous item
  },
})
