-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup({
    function(use)
        -- Plenary for multiple plugins
        use { 'nvim-lua/plenary.nvim', lock = true }
        -- Packer can manage itself
        use { 'wbthomason/packer.nvim', lock = true }
        -- Theme
        use { "navarasu/onedark.nvim", lock = true }
        -- use Ctrl + hjkl to navigate windows
        use { "christoomey/vim-tmux-navigator", lock = true }
        -- Telescope
        use { 'nvim-telescope/telescope.nvim', lock = true }
        use { 'nvim-telescope/telescope-fzf-native.nvim', lock = true, run = 'make' }
        -- Treesitter
        use { 'nvim-treesitter/nvim-treesitter', lock = true, run = { ':TSUpdate' } }
        -- Harpoon
        use { "theprimeagen/harpoon", lock = true }
        -- Undotree
        use { "mbbill/undotree", lock = true}
        -- LSP ZERO
        use {
            'VonHeikemen/lsp-zero.nvim',
            lock = true,
            branch = 'v3.x',
            requires = {
                --- Uncomment these if you want to manage LSP servers from neovim
                { 'williamboman/mason.nvim',           lock = true },
                { 'williamboman/mason-lspconfig.nvim', lock = true },

                -- LSP Support
                { 'neovim/nvim-lspconfig',             lock = true },
                -- Autocompletion
                { 'hrsh7th/nvim-cmp',                  lock = true },
                { 'hrsh7th/cmp-nvim-lsp',              lock = true },
                { 'L3MON4D3/LuaSnip',                  lock = true },
            }
        }
        -- Autocompleting brackets
        use { "windwp/nvim-autopairs", lock = true }

        -- Commenting with gc
        use { "numToStr/Comment.nvim", lock = true }

        -- File Explorer
        use { "nvim-tree/nvim-tree.lua", lock = true }
        -- Git side bar markers
        use { 'lewis6991/gitsigns.nvim', lock = true }
        -- Pretty status bar
        use {
            'nvim-lualine/lualine.nvim',
            lock = true,
            requires = { 'nvim-tree/nvim-web-devicons', opt = true, lock = true }
        }
        -- Inverter for keywords
        use { 'nguyenvukhang/nvim-toggler', lock = true }
        -- More make stuff pretty
        use { 'stevearc/dressing.nvim', lock = true }
        -- smooth scroll
        use { 'karb94/neoscroll.nvim', lock = true }
        -- obsididan 
        use { 'epwalsh/obsidian.nvim', lock = true }
    end,
    config = { snapshot_path = "/Users/lennart/dotfiles/packer_logs" }
})
