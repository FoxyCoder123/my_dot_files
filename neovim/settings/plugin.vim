call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'mattn/emmet-vim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'onsails/lspkind.nvim'
    Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'windwp/nvim-ts-autotag'
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'numToStr/Comment.nvim'
    Plug 'navarasu/onedark.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
call plug#end()
