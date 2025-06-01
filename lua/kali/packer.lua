-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use ({
	  'sainnhe/gruvbox-material',
	  config = function()
		  vim.cmd.colorscheme('gruvbox-material')
	  end
  })

  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  use({'neovim/nvim-lspconfig'})
  use({'hrsh7th/nvim-cmp'})
  use({'hrsh7th/cmp-nvim-lsp'})

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
      config = function()
          require("nvim-autopairs").setup({})
      end
  }

  use {
      'L3MON4D3/LuaSnip',
      requires = { 'rafamadriz/friendly-snippets' }
  }

  use {
      'akinsho/toggleterm.nvim',
      tag = '*',
      config = function()
        require("toggleterm").setup({
          -- Open in floating mode by default
          direction = 'float',
          -- Make it start PowerShell (pwsh) instead of cmd
          shell = 'pwsh',
          -- Optional: Fancy border
          float_opts = {
            border = 'rounded',
            width = function() return math.floor(vim.o.columns * 0.8) end,  -- 80% of window width
            height = function() return math.floor(vim.o.lines * 0.4) end,    -- 40% of window height
          },
          -- Close terminal window when process exits (avoid lingering)
          close_on_exit = true,
        })
      end
    }

    -- use 'stevearc/oil.nvim'
  use 'andweeb/presence.nvim'
end)
