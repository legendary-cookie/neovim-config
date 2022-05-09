return require('packer').startup(function(use)
    -- packer manages itself
    use 'wbthomason/packer.nvim'
    -- gruvbox colorscheme
    use {
        'morhetz/gruvbox',
        event = 'VimEnter',
        config = 'vim.cmd[[colorscheme gruvbox]]'
    }
    -- UI
    use 'lukas-reineke/indent-blankline.nvim'
    use 'Pocco81/TrueZen.nvim'
    use {
        'ojroques/nvim-hardline',
        config = function() require('hardline').setup {} end
    }
    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}},
        cmd = 'Telescope'
    }
    -- Utility
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use {
        "ellisonleao/glow.nvim",
        branch = 'main',
        run = ':GlowInstall',
        cmd = 'Glow'
    }
end)
