-- Load NvChad's default LSP configuration
require("nvchad.configs.lspconfig").defaults()

-- List of language servers to enable
local servers = { "html", "cssls", "ts_ls", "eslint", "gopls", "clangd" }

-- Enable them
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
