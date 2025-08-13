require("mason").setup()
require("mason-lspconfig").setup({
    -- A list of servers to ensure are installed.
    -- These will be installed automatically by mason-lspconfig.
    -- Alternatively, you can leave this empty and install manually
    -- or use the ensure_installed function.
    ensure_installed = { "clangd", "pyright", "ruff", "lua_ls" },
})

-- In your nvim-lspconfig setup, you would then iterate over servers
-- that mason-lspconfig knows about:
local capabilities = require('cmp_nvim_lsp').default_capabilities()


-- A catch-all configuration for all LSPs (optional)
vim.lsp.config('*', {
    capabilities = capabilities,
    -- shared common settings, on_attach, etc.
})

-- clangd with custom settings
vim.lsp.config('clangd', {
    capabilities = capabilities,
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "h", "hpp" },
    -- on_attach = on_attach,
})

-- Pyright lsp
vim.lsp.config('pyright', {
    capabilities = capabilities,
    filetypes = { "python" },
    settings = {
        pyright = {
            disableOrganizeImports = true,
            autoImportCompletion = true,
        },
    },
})

-- lua_ls with globals
vim.lsp.config('lua_ls', {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
})

-- Cmake lsp
vim.lsp.config('cmake-language-server', {
    capabilities = capabilities,
})
