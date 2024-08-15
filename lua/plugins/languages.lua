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
                        print("lsp set: ", server_name)
                        require("lspconfig")[server_name].setup({})
                    end,
                }
            })
        end,
    },
}
