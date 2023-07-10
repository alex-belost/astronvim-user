return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- {
  --   "neoclide/coc.nvim",
  --   branch = "master",
  --   lazy = false,
  --   -- event = "User AstroFile",
  -- },
  -- {
  --   dir = "~/Projects/personal-projects/logger",
  --   event = "User AstroFile",
  --   config = function() require("logger").setup() end,
  --   requires = "nvim-treesitter/nvim-treesitter",
  -- },
  {
    "tpope/vim-fugitive",
    event = "User AstroGitFile",
    cmd = { "Git" },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "User AstroFile",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  },
  {
    "nvim-treesitter/playground",
    event = "User AstroFile",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "User AstroFile",
    config = function()
      require("lsp_signature").setup {
        bind = true,
      }
    end,
  },
  {
    "nacro90/numb.nvim",
    event = "User AstroFile",
    opts = {
      show_numbers = true, -- Enable 'number' for the window while peeking
      show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      hide_relativenumbers = true, -- Enable turning off 'relativenumber' for the window while peeking
      number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
      centered_peeking = true, -- Peeked line will be centered relative to window
    },
  },
  {
    "ray-x/web-tools.nvim",
    event = "User AstroFile",
    config = function()
      require("web-tools").setup {
        keymaps = {
          repeat_rename = "", -- . to repeat
        },
        hurl = {
          show_headers = false, -- do not show http headers
          floating = false, -- use floating windows (need guihua.lua)
          formatters = {
            json = { "jq" },
            html = { "prettier", "--parser", "html" },
          },
        },
      }
    end,
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astronvim.utils.status"
      opts.statusline = { -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode { mode_text = { padding = { left = 1, right = 1 } } }, -- add the mode text
        status.component.git_branch(),
        status.component.file_info { filetype = {}, filename = false, file_modified = false },
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.lsp(),
        status.component.treesitter(),
        status.component.nav(),
        -- remove the 2nd mode indicator on the right
      }

      -- return the final configuration table
      return opts
    end,
  },
}
