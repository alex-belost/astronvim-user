return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  {
    dir = "~/Projects/personal-projects/logger",
    event = "BufRead",
    config = function() require("logger").setup() end,
    requires = "nvim-treesitter/nvim-treesitter",
  },
  {
    "tpope/vim-fugitive",
    event = "User AstroGitFile",
  },
  {
    "ThePrimeagen/harpoon",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "BufRead",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  },
  {
    "nvim-treesitter/playground",
    event = "BufRead",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "kylechui/nvim-surround",
    event = "BufRead",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "nacro90/numb.nvim",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
        hide_relativenumbers = true, -- Enable turning off 'relativenumber' for the window while peeking
        number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
        centered_peeking = true, -- Peeked line will be centered relative to window
      }
    end,
  },
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   lazy = false,
  --   config = function() require("user.plugins.custom.nvim-tree").setup() end,
  -- },
}
