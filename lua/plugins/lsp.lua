local lspconfig = require('lspconfig')

-- clangd LSP config (C++)
lspconfig.clangd.setup {
    cmd = {
        "clangd"
    },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "h", "hpp" },
    -- on_attach = on_attach, -- To highlight variables under cursor
} -- setting up clangd for cpp files

-- pyright LSP config (Python)
lspconfig.pyright.setup({
    filetypes = { "python" },
    settings = {
        pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
            autoImportCompletion = true,
        },
    }
})

-- ruff LSP config (Python) for formatting
lspconfig.ruff.setup({})

-- lua_ls LSP config (Lua)
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        }
    }
})

-- neocmake LSP config (Cmake)
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.neocmake.setup {
    capabilities = capabilities,
}

-- Server-specific settings. See `:help lspconfig-setup`
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>p', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>n', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.setloclist)


-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

        vim.keymap.set('n', '<leader>he', function()
            vim.lsp.inlay_hint.enable(true)
        end, opts, { desc = "Enable LSP inlay hints" })
        vim.keymap.set('n', '<leader>hd', function()
            vim.lsp.inlay_hint.enable(false)
        end, opts, { desc = "Disable LSP inlay hints" })

        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<leader>wl', function()
        -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        vim.keymap.set('n', '<leader>dt', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>fa', vim.lsp.buf.code_action, opts) -- to display auto fix window
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>i', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

-- Disable hover in favor of Pyright
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
            return
        end
        if client.name == 'ruff' then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
        end
    end,
    desc = 'LSP: Disable hover capability from Ruff',
})


lspconfig.util.default_config.on_init = function(client, _)
    client.server_capabilities.semanticTokensProvider = nil
end
