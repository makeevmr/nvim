-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g                                     -- Global variables

-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.opt.mouse = 'a'                                 -- Enable mouse support
vim.opt.clipboard = "unnamedplus"                   -- Copy/paste to system clipboard
vim.opt.swapfile = false                            -- Don't use swapfile
vim.opt.completeopt = 'menuone,noinsert,noselect'   -- Autocomplete options
vim.opt.fileencoding = "utf-8"                      -- The encoding written to a file
vim.lsp.set_log_level("off")                        -- Disalbe lsp log file

-----------------------------------------------------------
-- No end of file when saving
-----------------------------------------------------------
vim.opt.binary = true
vim.opt.endofline = false
vim.g.noeol = true

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
---
vim.opt.number = false                      -- Set numbered lines
vim.opt.showmatch = true                    -- Highlight matching parenthesis
vim.opt.foldmethod = 'marker'               -- Enable folding (default 'foldmarker')
vim.opt.splitright = true                   -- Vertical split to the right
vim.opt.splitbelow = true                   -- Horizontal split to the bottom
vim.opt.ignorecase = true                   -- Ignore case letters when search
vim.opt.smartcase = true                    -- Ignore lowercase for the whole pattern
vim.opt.linebreak = true                    -- Wrap on word boundary
vim.opt.termguicolors = true                -- Enable 24-bit RGB colors
vim.opt.laststatus = 3                      -- Set global statusline
vim.opt.undofile = true                     -- Enable persistent undo
vim.opt.wrap = true                         -- Display lines as one long line
vim.opt.linebreak = true                    -- Companion to wrap, don't split words
vim.opt.cursorline = true                   -- Highlight cursorline
vim.opt.colorcolumn = '81'                  -- Line lenght marker at 81 columns
vim.wo.number = true                        -- Hybrid number lines
vim.wo.relativenumber = true                -- Hybrid number lines
vim.opt.guicursor = "n-v-i-c:block-Cursor"  -- Block cursor

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.shiftwidth = 4          -- Shift 4 spaces when tab
vim.opt.tabstop = 4             -- 1 tab == 4 spaces
vim.opt.smartindent = false     -- Autoindent new lines
vim.opt.signcolumn = "yes"      -- Always show the sign column, otherwise it would shift the text each time
vim.opt.scrolloff = 8           -- Minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8       -- Minimal number of screen columns either side of cursor if wrap is `false`

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
vim.opt.hidden = true           -- Enable background buffers
vim.opt.history = 100           -- Remember N lines in history
vim.opt.lazyredraw = true       -- Faster scrolling
vim.opt.synmaxcol = 240         -- Max column for syntax highlight
vim.opt.updatetime = 200        -- ms to wait for trigger an event

-----------------------------------------------------------
-- Font
-----------------------------------------------------------
vim.opt.guifont = "monospace:h17"   -- The font used in graphical neovim applications

-----------------------------------------------------------
-- Wrap
-----------------------------------------------------------
vim.opt.whichwrap = "bs<>[]hl"      -- Which "horizontal" keys are allowed to travel to prev/next line

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
vim.opt.shortmess:append "c"        -- Don't give |ins-completion-menu| messages
vim.opt.iskeyword:append "-"        -- Hyphenated words recognized by searches

-----------------------------------------------------------
-- Highlight on yank
-----------------------------------------------------------
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end,
})

 -- Disable builtin plugins
 local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
    "tutor",
    "rplugin",
    "synmenu",
    "optwin",
    "compiler",
    "bugreport",
    "ftplugin",
 }
 
 for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
 end
 
