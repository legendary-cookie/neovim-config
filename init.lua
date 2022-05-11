require('config.keybinds').setup()

return require('packer').startup({
    function(use)
        -- packer manages itself
        use 'wbthomason/packer.nvim'
        -- gruvbox colorscheme
        use {
            'morhetz/gruvbox',
            event = 'VimEnter',
            config = 'vim.cmd[[colorscheme gruvbox]]'
        }
        -- UI
        use {'stevearc/dressing.nvim'}
        use {
            'lukas-reineke/indent-blankline.nvim',
            config = function()
                require('indent_blankline').setup {
                    filetype_exclude = {'dashboard', 'packer', 'guihua'}
                }
            end
        }
        use {
            'vuki656/package-info.nvim',
            requires = "MunifTanjim/nui.nvim",
            config = function() require('package-info').setup() end
        }
        use {
            'ms-jpq/chadtree',
            run = ":CHADdeps"
            -- cmd = {"CHADopen"}
        }
        use {
            'romgrk/barbar.nvim',
            requires = {'kyazdani42/nvim-web-devicons'},
            config = function()
                vim.g.bufferline = {
                    closable = false,
                    clickable = false,
                    exclude_ft = {'dashboard', 'packer', 'guihua'}
                }
            end
        }
        use {
            'nkakouros-original/numbers.nvim',
            config = function()
                require('numbers').setup {
                    excluded_filetypes = {'dashboard', 'packer', 'guihua'}
                }
            end
        }
        use {
            'Pocco81/TrueZen.nvim',
            cmd = {'TZFocus', 'TZAtaraxis', 'TZMinimalist'}
        }
        use {
            'ojroques/nvim-hardline',
            config = function() require('hardline').setup {} end
        }
        use {'glepnir/dashboard-nvim'}
        -- Telescope
        use {
            'nvim-telescope/telescope.nvim',
            requires = {{'nvim-lua/plenary.nvim'}}
        }
        -- Comments
        use {
            'b3nj5m1n/kommentary',
            config = function()
		local kommconf = require('kommentary.config')
		kommconf.use_default_mappings()
                --kommconf.use_extended_mappings()
            end
        }
        -- Git
        use {
            'sindrets/diffview.nvim',
            requires = 'nvim-lua/plenary.nvim',
            config = function()
                -- local cb = require'diffview.config'.diffview_callback
                require'diffview'.setup {diff_binaries = true}
            end
        }
        use {
            'lewis6991/gitsigns.nvim',
            config = function() require('gitsigns').setup() end
        }
        use {
            'TimUntersberger/neogit',
            requires = {'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim'},
            config = function()
                local neogit = require('neogit')
                neogit.setup {integrations = {diffview = true}}
            end
        }
        -- Utility
        use 'jghauser/mkdir.nvim'
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
        -- LSP
        use {
            'akinsho/toggleterm.nvim',
            config = function()
                require("toggleterm").setup {
                    size = function(term)
                        if term.direction == "vertical" then
                            return vim.o.columns * 0.25
                        end
                    end,
                    open_mapping = [[<leader>t]],
                    direction = 'vertical'
                }
            end
        }
        use {
            'kosayoda/nvim-lightbulb',
            config = {
                vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
            }
        }
        use {
            'nvim-treesitter/nvim-treesitter',
            run = 'vim.cmd[[:TSUpdate]]',
            config = function()
                require'nvim-treesitter.configs'.setup {
                    ensure_installed = {"c", "lua", "go", "cmake"},
                    highlight = {enable = true}
                }
            end
        }
        use {
            'sudormrfbin/cheatsheet.nvim',

            requires = {
                {'nvim-telescope/telescope.nvim'}, {'nvim-lua/popup.nvim'},
                {'nvim-lua/plenary.nvim'}
            }
        }
        use {
            "williamboman/nvim-lsp-installer",
            requires = {"neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp"},
            config = function()
                local servers = {"rust_analyzer", "clangd", "sumneko_lua"}
                require("nvim-lsp-installer").setup({
                    ensure_installed = servers,
                    automatic_installation = true,
                    ui = {
                        icons = {
                            server_installed = "✓",
                            server_pending = "➜",
                            server_uninstalled = "✗"
                        }
                    }
                })
                local capabilities = vim.lsp.protocol.make_client_capabilities()
                capabilities = require('cmp_nvim_lsp').update_capabilities(
                                   capabilities)
                local lspconfig = require("lspconfig")
                for _, server in ipairs(servers) do
                    lspconfig[server].setup {capabilities = capabilities}
                end
            end

        }
        use {
            'hrsh7th/nvim-cmp',
            requires = {'saadparwaiz1/cmp_luasnip'},
            config = function()
                local cmp = require 'cmp'
                local luasnip = require 'luasnip'
                cmp.setup {
                    snippet = {
                        expand = function(args)
                            luasnip.lsp_expand(args.body)
                        end
                    },
                    mapping = cmp.mapping.preset.insert({
                        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                        ['<C-f>'] = cmp.mapping.scroll_docs(4),
                        ['<C-Space>'] = cmp.mapping.complete(),
                        ['<CR>'] = cmp.mapping.confirm {
                            behavior = cmp.ConfirmBehavior.Replace,
                            select = true
                        },
                        ['<Tab>'] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                            elseif luasnip.expand_or_jumpable() then
                                luasnip.expand_or_jump()
                            else
                                fallback()
                            end
                        end, {'i', 's'}),
                        ['<S-Tab>'] = cmp.mapping(function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item()
                            elseif luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                            else
                                fallback()
                            end
                        end, {'i', 's'})
                    }),
                    sources = {{name = 'nvim_lsp'}, {name = 'luasnip'}}
                }
            end
        }
        use 'hrsh7th/cmp-nvim-lsp'
        use 'saadparwaiz1/cmp_luasnip'
        use 'L3MON4D3/LuaSnip'
        use {
            'windwp/nvim-autopairs',
            requires = {'hrsh7th/nvim-cmp'},
            config = function()
                require('nvim-autopairs').setup {
                    disable_filetype = {
                        "TelescopePrompt", "guihua", "guihua_rust", "clap_input"
                    }
                }
                if vim.o.ft == 'clap_input' and vim.o.ft == 'guihua' and
                    vim.o.ft == 'guihua_rust' then
                    require'cmp'.setup.buffer {completion = {enable = false}}
                end
            end
        }
        use {
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function() require("trouble").setup {} end
        }
    end,
    config = {display = {open_fn = require('packer.util').float}}
})
