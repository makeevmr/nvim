require("mason").setup()
require("mason-lspconfig").setup({
    -- A list of servers to ensure are installed.
    -- These will be installed automatically by mason-lspconfig.
    -- Alternatively, you can leave this empty and install manually
    -- or use the ensure_installed function.
    ensure_installed = { "clangd", "pyright", "ruff", "lua_ls", "ts_ls" },
    -- ensure_installed = { "clangd", "pyright", "ruff", "lua_ls", "cmake", "ts_ls" },
})

-- In your nvim-lspconfig setup, you would then iterate over servers
-- that mason-lspconfig knows about:
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local navic = require("nvim-navic")
local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

-- C/C++ lsp
vim.lsp.config.clangd = {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "h", "hpp" },
}

-- Python lsp
vim.lsp.config.pyright = {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "python" },
    settings = {
        pyright = {
            disableOrganizeImports = true,
            autoImportCompletion = true,
        },
    },
}

-- Lua lsp
vim.lsp.config.lua_ls = {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
}

-- Typescript lsp
vim.lsp.config.ts_ls = {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- Cmake lsp
-- vim.lsp.config.cmake = {
--     capabilities = capabilities,
--     cmd = { 'cmake-language-server' },
--     filetypes = { 'cmake' },
-- }

vim.lsp.enable({ 'clangd', 'pyright', 'lua_ls', 'ts_ls' })
