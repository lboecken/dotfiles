-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup({
    function(use)
        -- Plenary for multiple plugins
        use 'nvim-lua/plenary.nvim'
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'
        -- Theme
        use { "navarasu/onedark.nvim" }
        -- use Ctrl + hjkl to navigate windows
        use { "christoomey/vim-tmux-navigator" }
        -- Telescope
        use { 'nvim-telescope/telescope.nvim' }
        -- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        -- Treesitter
        use { 'nvim-treesitter/nvim-treesitter', run = { ':TSUpdate' } }
        -- Harpoon
        use { "theprimeagen/harpoon" }
        -- Undotree
        use("mbbill/undotree")
        -- Fugitive
        use { "tpope/vim-fugitive" }
        -- LSP ZERO
        use {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            requires = {
                --- Uncomment these if you want to manage LSP servers from neovim
                { 'williamboman/mason.nvim' },
                { 'williamboman/mason-lspconfig.nvim' },

                -- LSP Support
                { 'neovim/nvim-lspconfig' },
                -- Autocompletion
                { 'hrsh7th/nvim-cmp' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'L3MON4D3/LuaSnip' },
            }
        }
    end,
    config = { snapshot_path = "/Users/lennart/dotfiles/packer_logs" }
})
