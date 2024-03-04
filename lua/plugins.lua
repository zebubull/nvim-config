local plugins = {
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('nordic').load()
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('config.lualine')
        end,
    },
    {
        'romgrk/barbar.nvim',
        dependencies = {
          'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
          'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        lazy = false,
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            animation = true,
            insert_at_start = true,
        },
        keys = require('keymaps.barbar'),
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true,
        keys = require('keymaps.toggleterm'),
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                ignore = '^$',
                toggler = {
                    line = '<leader>cl',
                    block = '<leader>cb',
                },
                opleader = {
                    line = '<leader>cl',
                    block = '<leader>cb',
                },
            })
        end,
        lazy = false,
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        init = function()
            vim.o.timeout = true
            vim.o.timoutlen = 300
        end,
        config = function()
            local wk = require('which-key')
            wk.setup({key_labels = { ['<leader>'] = 'SPC'}})
        end,
    },
    {
        'nvim-tree/nvim-tree.lua',
        version = '*',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('nvim-tree').setup({
                filters = { custom = { '.git', '.zig-cache' }, exclude = { '.gitignore'} }
            })
        end,
        keys = require('keymaps.tree'),
        lazy = false,
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            local configs = require('nvim-treesitter.configs')

            configs.setup({
                ensure_installed = { 'c', 'lua', 'rust', 'zig', 'java', 'fish'},
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = require('keymaps.telescope')
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'saadparwaiz1/cmp_luasnip',
            'onsails/lspkind.nvim',
            'L3MON4D3/LuaSnip',
        },
        event = 'InsertEnter',
        config = function()
            require('config.snippets')
        end,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {
                'glepnir/lspsaga.nvim',
                branch = 'main',
            },
            -- 'williamboman/mason.nvim',
            -- 'williamboman/mason-lspconfig.nvim',
        },
        event = 'InsertEnter',
        cmd = {
            'LspInfo',
            'LspStart',
            'LspRestart',
            -- 'Mason',
            'LspLog',
        },
        config = function()
            require('config.lsp')
        end,
    },
}

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

require('lazy').setup(plugins)
