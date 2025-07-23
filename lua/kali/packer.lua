-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'sainnhe/gruvbox-material',
    })
    use({
        'shaunsingh/nord.nvim',
    })
    use 'dgox16/oldworld.nvim'
    use 'Mofiqul/vscode.nvim'
    use('bluz71/vim-moonfly-colors')
    use('kdheepak/monochrome.nvim')
    use 'catppuccin/nvim'
    use 'nyoom-engineering/oxocarbon.nvim'

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use({ 'neovim/nvim-lspconfig' })
    use({ 'hrsh7th/nvim-cmp' })
    use({ 'hrsh7th/cmp-nvim-lsp' })

    use({
        'mrcjkb/rustaceanvim',
        version = "^6",
        lazy = false,
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
        },
    })

    use {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup {
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry",
                },
            }
        end
    }


    use "williamboman/mason-lspconfig.nvim"

    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    use {
        'L3MON4D3/LuaSnip',
        requires = { 'rafamadriz/friendly-snippets' }
    }

    -- use 'stevearc/oil.nvim'
    use 'andweeb/presence.nvim'
    use 'tikhomirov/vim-glsl'
end)
