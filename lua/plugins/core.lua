return {
	{ "folke/lazy.nvim"},
	{ "LazyVim/LazyVim"},
	{ "tpope/vim-fugitive"},
{
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>fwg', builtin.grep_string, {})
		vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
		vim.keymap.set('n', '<C-p>', builtin.git_files, {})
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
	end
    },
    {
	"nvim-treesitter/nvim-treesitter",
    	build = ":TSUpdate",
	opts = {
	    ensure_installed = { "bash", "c", "cpp", "html", "javascript", "json", "lua", "markdown", "printf", "python", "regex", "vim", "xml", "yaml", "go" },
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
	indent = {enable = true }},
	config = function(_,opts)
	     require("nvim-treesitter.configs").setup(opts)
     end
    },
	{
  "debugloop/telescope-undo.nvim",
  dependencies = { -- note how they're inverted to above example
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  keys = {
    { -- lazy style key map
      "<leader>u",
      "<cmd>Telescope undo<cr>",
      desc = "undo history",
    },
  },
  opts = {
    -- don't use `defaults = { }` here, do this in the main telescope spec
    extensions = {
      undo = {},
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("undo")
  end,
},
	 {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                icons = false,
            })

            vim.keymap.set("n", "<leader>tt", function()
                require("trouble").toggle()
            end)

            vim.keymap.set("n", "[t", function()
                require("trouble").next({skip_groups = true, jump = true});
            end)

            vim.keymap.set("n", "]t", function()
                require("trouble").previous({skip_groups = true, jump = true});
            end)

        end
    },
}
