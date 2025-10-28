require("mason").setup()
require("mason-lspconfig").setup({
    -- A list of servers to ensure are installed.
    -- These will be installed automatically by mason-lspconfig.
    -- Alternatively, you can leave this empty and install manually
    -- or use the ensure_installed function.
    ensure_installed = { "clangd", "pyright", "ruff", "lua_ls", "cmake", "ts_ls" },
})

-- In your nvim-lspconfig setup, you would then iterate over servers
-- that mason-lspconfig knows about:
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- C/C++ lsp
vim.lsp.config("clangd", {
    capabilities = capabilities,
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "h", "hpp" },
    -- on_attach = on_attach,
})

-- Python lsp
vim.lsp.config("pyright", {
    capabilities = capabilities,
    filetypes = { "python" },
    settings = {
        pyright = {
            disableOrganizeImports = true,
            autoImportCompletion = true,
        },
    },
})

-- Lua lsp
vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
})

-- Typescript lsp
vim.lsp.config("ts_ls", {
    capabilities = capabilities,
})

-- Cmake lsp
vim.lsp.config("cmake", {
    capabilities = capabilities,
})
