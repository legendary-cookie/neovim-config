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
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require('gitsigns').setup {
                signs = {
                    add = {
                        hl = "GitSignsAdd",
                        text = "+",
                        numhl = "GitSignsAddNr",
                        linehl = "GitSignsAddLn"
                    },
                    change = {
                        hl = "GitSignsChange",
                        text = "*",
                        numhl = "GitSignsChangeNr",
                        linehl = "GitSignsChangeLn"
                    },
                    delete = {
                        hl = "GitSignsDelete",
                        text = "-",
                        numhl = "GitSignsDeleteNr",
                        linehl = "GitSignsDeleteLn"
                    },
                    topdelete = {
                        hl = "GitSignsDelete",
                        text = "‾",
                        numhl = "GitSignsDeleteNr",
                        linehl = "GitSignsDeleteLn"
                    },
                    changedelete = {
                        hl = "GitSignsChange",
                        text = "~",
                        numhl = "GitSignsChangeNr",
                        linehl = "GitSignsChangeLn"
                    }
                },
                numhl = false,
                linehl = false,
                watch_gitdir = {interval = 1000, follow_files = true},
                current_line_blame_opts = {delay = 1000, position = "eol"},
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil,
                diff_opts = {internal = true}
            }
        end
    }
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
