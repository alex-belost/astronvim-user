return {
  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },
  -- { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  -- customize alpha options
  --
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local dashboard = require "alpha.themes.dashboard"

      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }

      -- local button = require("astronvim.utils").alpha_button
      opts.section.buttons.val = {
        dashboard.button("l", "  Last Session  ", "<cmd>SessionManager! load_last_session<cr>"),
        dashboard.button("s", "󱂬  Load Session  ", "<cmd>SessionManager! load_session<cr>"),
        dashboard.button("f", "  Find File  ", ":lua require('telescope.builtin').find_files()<cr>"),
        dashboard.button("o", "  Recents  ", ":lua require('telescope.builtin').oldfiles()<cr>"),
        dashboard.button("w", "󰾺  Find Word  ", ":lua require('telescope.builtin').live_grep()<cr>"),
        dashboard.button("m", "  Bookmarks  ", ":lua require('telescope.builtin').marks()<cr>"),
      }

      return opts
    end,
  },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call

      require("luasnip.loaders.from_vscode").lazy_load { paths = { "./lua/user/snippets" } } -- load snippets paths
      require("luasnip.loaders.from_lua").lazy_load { paths = { "./lua/user/luasnippets" } } -- load snippets paths
    end,
  },
}
