local lspconfig = require'lspconfig'

-- Go LSP setup
lspconfig.gopls.setup{}

-- Groovy LSP setup
lspconfig.groovyls.setup{}

-- Auto-format on save
vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.groovy lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.yaml lua vim.lsp.buf.format()]]

