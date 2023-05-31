local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end


vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer for lua plugins
  use 'Mofiqul/dracula.nvim'   -- Dracula Theme

  -- Status line bar
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'L3MON4D3/LuaSnip' -- Snippet

  -- LSP and autocomplete
  use 'onsails/lspkind-nvim'  -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer'    -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp'  -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'      -- Completion
  use 'neovim/nvim-lspconfig' -- LSP
  use 'glepnir/lspsaga.nvim'  -- LSP UIs


  -- Prettier formater
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use 'windwp/nvim-autopairs'  -- Auto pairs
  use 'windwp/nvim-ts-autotag' -- Auto tag html

  -- File browser
  use 'nvim-lua/plenary.nvim'                      -- Common utilities
  use 'kyazdani42/nvim-web-devicons'               -- File icons
  use 'nvim-telescope/telescope.nvim'              -- Finder files
  use 'nvim-telescope/telescope-file-browser.nvim' -- Local telescope-file-browser

  -- Tab navigator
  use 'akinsho/nvim-bufferline.lua'
  use 'norcalli/nvim-colorizer.lua'

  -- Git plugins
  use 'lewis6991/gitsigns.nvim' -- Mark changes in file
  use 'dinhhuy258/git.nvim'     -- For git blame & browse

  -- Mason plugins
  use 'williamboman/mason.nvim'           -- Add easily LSP servers
  use 'williamboman/mason-lspconfig.nvim' -- Config for mason

  -- Comments in line
  use { 'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  }
end)
