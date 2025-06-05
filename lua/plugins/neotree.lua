vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1]])

-- Highlight entire line for errors
-- Highlight the line number for warnings
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
        texthl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
            [vim.diagnostic.severity.HINT] = "HintMsg",
        },
        -- numhl = {
            -- [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            -- [vim.diagnostic.severity.WARN] = "WarningMsg",
            -- [vim.diagnostic.severity.HINT] = "HintMsg",
        -- },
        -- linehl = {
        --     [vim.diagnostic.severity.ERROR] = "ErrorMsg",
        --     [vim.diagnostic.severity.WARN] = "WarningMsg",
        --     [vim.diagnostic.severity.HINT] = "HintMsg",
        -- },
    },
})

-- check (https://github.com/nvim-neo-tree/neo-tree.nvim) to see all ptions
require("neo-tree").setup({
	close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
        window = {
		position = "left",
		width = 30,
		mapping_options = {
			noremap = true,
			nowait = true,
		},
	},
	filesystem = {
		  filtered_items = {
			visible = false, -- when true, they will just be displayed differently than normal items
			hide_dotfiles = true,
			hide_gitignored = true,
			hide_hidden = false, -- only works on Windows for hidden files/directories
			hide_by_name = {
			--"node_modules"
			},
			hide_by_pattern = { -- uses glob style patterns
			--"*.meta",
			--"*/src/*/tsconfig.json",
			},
			always_show = { -- remains visible even if other settings would normally hide it
			--".gitignored",
			},
			never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
			--".DS_Store",
			--"thumbs.db"
			},
			never_show_by_pattern = { -- uses glob style patterns
			--".null-ls_*",
			},
		},
	},
})
