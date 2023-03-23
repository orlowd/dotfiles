local ok, packer = pcall(require, 'packer')
if not ok then
    print 'Failed to load packer!'
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
    },
}

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    use 'lewis6991/impatient.nvim'

    use 'windwp/nvim-autopairs'
    use 'numToStr/Comment.nvim'

    use 'hrsh7th/nvim-cmp'          -- The completion engine plugin
    use 'hrsh7th/cmp-buffer'        -- Buffer completions
    use 'hrsh7th/cmp-path'          -- Path completions
    use 'hrsh7th/cmp-cmdline'       -- Cmdline completions
    use 'hrsh7th/cmp-nvim-lsp'      -- Completions from lsp

    use 'L3MON4D3/LuaSnip'              -- Snippet engine
    use 'saadparwaiz1/cmp_luasnip'      -- Snippet completions
    use 'rafamadriz/friendly-snippets'  -- A bunch of snippets to use

    use 'williamboman/mason.nvim'           -- Automatically install LSPs to stdpath for neovim
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'             -- Neovim LSP client configurations

    use 'j-hui/fidget.nvim'                 -- Useful status updates for LSP

    use 'tamago324/nlsp-settings.nvim'      -- Language server settings defined in json
    use 'jose-elias-alvarez/null-ls.nvim'   -- LSP for formatters and linters
    use 'jay-babu/mason-null-ls.nvim'

    use 'folke/neodev.nvim'             -- Lua Neovim init.lua and plugin development configuration
    use 'simrat39/rust-tools.nvim'      -- Rust configuration

    use 'kyazdani42/nvim-web-devicons'      -- Required by nvim-tree
    use 'kyazdani42/nvim-tree.lua'          -- Side pane directory view

    use 'nvim-telescope/telescope.nvim'     -- Smart file searcher

    -- Native C implementation of fzf algorithm for telescope
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use {
        'nvim-treesitter/nvim-treesitter',      -- Highlight, edit, and navigate code
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects'   -- Additional text objects via treesitter
    use 'JoosepAlviste/nvim-ts-context-commentstring'   -- Automatically set the 'commentstring' and 'comments'

    use 'nvim-lualine/lualine.nvim' -- Status line
    use 'lewis6991/gitsigns.nvim'   -- Git integration
    use 'tpope/vim-fugitive'        -- Git additions

    use 'lukas-reineke/indent-blankline.nvim'   -- Show indentation lines

    use 'marko-cerovac/material.nvim'
end)

