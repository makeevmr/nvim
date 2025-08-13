-- For plugins instalation we use lazy.nvim (https://github.com/folke/lazy.nvim)
-- All keymapings in lua/core/mappings.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- File Tree (https://github.com/nvim-neo-tree/neo-tree.nvim)
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    },
    -- For better syntax syntax highlighting (https://github.com/nvim-treesitter/nvim-treesitter)
    {
        'nvim-treesitter/nvim-treesitter'
    },
    -- For errors visyalizstion, go to defenition and so on (https://github.com/neovim/nvim-lspconfig)
    {
        'neovim/nvim-lspconfig'
    },
    -- Color scheme (https://github.com/ellisonleao/gruvbox.nvim)
    {
        "ellisonleao/gruvbox.nvim", priority = 1000
    },
    -- Color scheme (https://github.com/rose-pine/neovim)
    {
        "rose-pine/neovim"
    },
    -- For autocomplete visualization (https://github.com/hrsh7th/nvim-cmp)
    {
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "hrsh7th/nvim-cmp" },
    },
    -- For files and text search (https://github.com/nvim-telescope/telescope.nvim)
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- Autopairs (https://github.com/windwp/nvim-autopairs)
    {
        'windwp/nvim-autopairs'
    },
    -- Surround (https://github.com/kylechui/nvim-surround)
    {
        'kylechui/nvim-surround'
    },
    -- Comments (https://github.com/terrortylor/nvim-comment)
    {
        { 'numToStr/Comment.nvim' }
    },
    -- Git support (https://github.com/lewis6991/gitsigns.nvim)
    {
        'lewis6991/gitsigns.nvim'
    },
    -- For better file navigation
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    -- For easy lsp installation
    {
        "mason-org/mason.nvim",
    },
    {
        "mason-org/mason-lspconfig.nvim"
    },
})
