local lspconfig = require'lspconfig'
require("mason").setup()

-- Go LSP setup
lspconfig.gopls.setup{}

-- Typescript LSP setup
lspconfig.ts_ls.setup{}

-- Lua LSP setup
lspconfig.luau_lsp.setup{}

-- Groovy LSP setup
lspconfig.groovyls.setup{}

-- Python LSP setuo
lspconfig.pyright.setup{}

-- Auto-format on save
vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.groovy lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.lua lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.py lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.js lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.yaml lua vim.lsp.buf.format()]]
