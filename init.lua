-- With help of (https://www.youtube.com/watch?v=4PzSNN45tcA&t=453s)

-- Core
require('core.config')          	-- Basic options
require('core.mappings')		    -- Keymaps
require('core.plugins')			    -- Lazyvim for plugins installation
require('core.colors')          	-- Gruvbox color scheme

-- Plugins
require('plugins.autopairs')        -- Bracket autopair support
require('plugins.cmp')              -- For autocomplete visualization
require('plugins.comment')          -- Comments support
require('plugins.gitsigns')         -- Git support
require('plugins.lsp')			    -- For errors highlighting, go to defenition, references, format and so on
require('plugins.neotree') 		    -- Files tree
require('plugins.surround')         -- Bracket autopair support
require('plugins.telescope')        -- Files search, grep, buffers
require('plugins.treesitter')		-- Better syntax highlighting
