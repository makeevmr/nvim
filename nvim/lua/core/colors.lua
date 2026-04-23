vim.o.background = "dark" -- or "light" for light mode

-- setup must be called before loading the colorscheme
-- gruvbox
require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true,    -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {
        dark0_hard = "#000000",
    },
    overrides = {
        ["@lsp.type.property.cpp"] = { fg = "#89C07C" },
    },
    dim_inactive = false,
    transparent_mode = false,
})

vim.cmd.colorscheme "gruvbox"
