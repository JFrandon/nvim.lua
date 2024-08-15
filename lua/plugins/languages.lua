return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "printf",
                "python",
                "regex",
                "vim",
                "xml",
                "yaml",
                "go",
            },
            highlight = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
            indent = { enable = true },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "stevearc/conform.nvim",
        dependencies = { "mason.nvim" },
        cmd = "ConformInfo",

        config = function(_, _)
            require("conform").setup({
                formatters_by_ft = {
                },
                format_on_save = {
                    -- These options will be passed to conform.format()
                    timeout_ms = 500,
                    lsp_format = "fallback",
                },
            })
        end,
        keys = {
            {
                "<leader>cF",
                function()
                    require("conform").format({ lsp_format = "fallback", timeout_ms = 3000 })
                end,
                mode = { "n", "v" },
                desc = "Format Injected Langs",
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "pylsp", "jinja_lsp", "lua_ls" },
                handlers = {
                    function(server_name) --default handler
                        require("lspconfig")[server_name].setup({})

                        map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
                        map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
                        map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
                        map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
                        map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
                        map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
                        map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
                        map('n', '<leader>gw', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
                        map('n', '<leader>gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
                        map('n', '<leader>ah', '<cmd>lua vim.lsp.buf.hover()<CR>')
                        map('n', '<leader>af', '<cmd>lua vim.lsp.buf.code_action()<CR>')
                        map('n', '<leader>ee', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
                        map('n', '<leader>ar', '<cmd>lua vim.lsp.buf.rename()<CR>')
                        map('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
                        map('n', '<leader>ai', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
                        map('n', '<leader>ao', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
                    end,
                }
            })
        end,
    },
}
