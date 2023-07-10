return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { -- further customize the options set by the community
    "catppuccin",
    priority = 1000,
    opts = {
      integrations = {
        -- sandwich = false,
        noice = true,
        mini = true,
        leap = true,
        markdown = true,
        neotest = true,
        cmp = true,
        overseer = true,
        lsp_trouble = true,
        ts_rainbow2 = true,
      },
    },
  },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.angular" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.project.nvim-spectre" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.indent.indent-blankline-nvim" },
  { import = "astrocommunity.indent.indent-tools-nvim" },
  { import = "astrocommunity.indent.mini-indentscope" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.harpoon" },
  { import = "astrocommunity.syntax.hlargs-nvim" },
  { import = "astrocommunity.lsp.inc-rename-nvim" },
  { import = "astrocommunity.lsp.lsp-inlayhints-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.dial-nvim" },
  { import = "astrocommunity.editing-support.text-case-nvim" },
  { import = "astrocommunity.editing-support.treesj" },
  {
    "treesj",
    keys = { { "gS", "<CMD>TSJToggle<CR>", desc = "Toggle Treesitter Join" } },
  },
  { import = "astrocommunity.file-explorer.oil-nvim" },
  {
    "oil.nvim",
    keys = {
      { "<leader>O", function() require("oil").open_float() end, desc = "Open folder in Oil" },
    },
    opts = {
      float = {
        padding = 10,
        max_width = 80,
        max_height = 60,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
      },
    },
  },
  { import = "astrocommunity.completion.copilot-lua" },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = 120,
      disabled_filetypes = { "help" },
    },
  },
}
