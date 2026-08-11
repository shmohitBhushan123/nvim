-- luacheck globals vim
local ok_lspconfig, lspconfig = pcall(require, 'lspconfig')
if not ok_lspconfig then
  return
end
require("mason").setup()
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local util = require('lspconfig/util')
local jdtls_lombok_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar"
local jdtls_cmd = { "jdtls" }
if vim.fn.filereadable(jdtls_lombok_path) == 1 then
  table.insert(jdtls_cmd, "--jvm-arg=-javaagent:" .. jdtls_lombok_path)
  table.insert(jdtls_cmd, "--jvm-arg=-Xbootclasspath/a:" .. jdtls_lombok_path)
end
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
  if client.name == "ts_ls" or client.name == "tsserver" or client.name == "jsonls" or client.name == "eslint" then
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

-- JavaScript and TypeScript LSP setup
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_dir = util.root_pattern({ ".git", "package.json", "tsconfig.json", "jsconfig.json" }),
  single_file_support = true,
}

-- ESLint LSP setup
lspconfig.eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = util.root_pattern({
    ".git",
    ".eslintrc",
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.json",
    "eslint.config.js",
    "eslint.config.mjs",
    "eslint.config.cjs",
    "package.json",
  }),
  settings = {
    workingDirectory = { mode = "auto" },
  },
}

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

-- Java LSP setup
lspconfig.jdtls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = jdtls_cmd,
  filetypes = { "java" },
  root_dir = util.root_pattern({ ".git", "pom.xml", "build.gradle", "build.gradle.kts", "mvnw", "gradlew" }),
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      completion = {
        favoriteStaticMembers = {
          "org.junit.Assert.*",
          "org.junit.Assume.*",
          "org.junit.jupiter.api.Assertions.*",
          "org.junit.jupiter.api.Assumptions.*",
          "org.junit.jupiter.api.DynamicContainer.*",
          "org.junit.jupiter.api.DynamicTest.*",
          "org.mockito.Mockito.*",
          "org.mockito.ArgumentMatchers.*",
          "org.mockito.Answers.*"
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        },
        useBlocks = true,
      },
      configuration = {
        runtimes = {
          -- Add your Java runtime configurations here if needed
          -- Example:
          -- {
          --   name = "JavaSE-11",
          --   path = "/path/to/jdk-11",
          -- },
          -- {
          --   name = "JavaSE-17",
          --   path = "/path/to/jdk-17",
          -- },
        }
      }
    }
  }
}

-- HTML LSP setup
lspconfig.superhtml.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "superhtml", "lsp" },
  filetypes = { "html" },
  root_dir = util.root_pattern({ ".git" }),
  single_file_support = true,
}

-- CSS LSP setup (also covers SCSS/LESS)
lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  root_dir = util.root_pattern({ ".git", "package.json" }),
  single_file_support = true,
  init_options = { provideFormatter = true },
  settings = {
    -- Ignore unknown at-rules (e.g. Tailwind's @tailwind/@apply/@layer)
    css = { lint = { unknownAtRules = "ignore" } },
    scss = { lint = { unknownAtRules = "ignore" } },
    less = { lint = { unknownAtRules = "ignore" } },
  },
}

-- Tailwind CSS LSP setup
lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "tailwindcss-language-server", "--stdio" },
  root_dir = util.root_pattern({
    "tailwind.config.js",
    "tailwind.config.cjs",
    "tailwind.config.mjs",
    "tailwind.config.ts",
    "postcss.config.js",
    "postcss.config.cjs",
    "postcss.config.mjs",
    "postcss.config.ts",
    ".git",
  }),
  settings = {
    tailwindCSS = {
      validate = true,
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidScreen = "error",
        invalidVariant = "error",
        invalidConfigPath = "error",
        invalidTailwindDirective = "error",
        recommendedVariantOrder = "warning",
      },
    },
  },
}

-- Auto-format on save
vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.groovy lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.lua lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.py lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.js lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.jsx lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.ts lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.tsx lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.yaml lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.java lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.html lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.css,*.scss,*.less lua vim.lsp.buf.format()]]
-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  virtual_text = true,
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
