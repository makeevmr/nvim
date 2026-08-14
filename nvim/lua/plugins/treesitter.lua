local supported_file_types = {
    "c",
    "cpp",
    "python",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "lua",
    "make",
    "cmake",
    "dockerfile",
    "vim",
    "vimdoc",
    "json",
    "yaml",
    "toml",
    "query",
    "markdown"
}

local treesitter = require('nvim-treesitter')

treesitter.setup()

treesitter.install(supported_file_types, { skip = { installed = true } })

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('TreesitterHighlight', { clear = true }),
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if lang and pcall(vim.treesitter.language.add, lang) then
            pcall(vim.treesitter.start, args.buf, lang)
        end
    end,
})
