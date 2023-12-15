return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity
  { import = "astrocommunity.colorscheme.catppuccin" },

  { import = "astrocommunity.pack.angular" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.html-css" },

  { import = "astrocommunity.lsp.inc-rename-nvim" },
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.lsp.garbage-day-nvim" },

  { import = "astrocommunity.indent.indent-blankline-nvim" },

  { import = "astrocommunity.bars-and-lines.scope-nvim" },

  { import = "astrocommunity.file-explorer.oil-nvim" },

  { import = "astrocommunity.completion.cmp-cmdline" },

  { import = "astrocommunity.editing-support.treesj" },
  { import = "astrocommunity.editing-support.text-case-nvim" },
  { import = "astrocommunity.editing-support.comment-box-nvim" },
  { import = "astrocommunity.editing-support.multicursors-nvim" },
  { import = "astrocommunity.editing-support.text-case-nvim" },
  { import = "astrocommunity.editing-support.yanky-nvim" },

  { import = "astrocommunity.project.project-nvim" },
  { import = "astrocommunity.project.nvim-spectre" },

  { import = "astrocommunity.syntax.vim-easy-align" },
  { import = "astrocommunity.syntax.hlargs-nvim" },

  { import = "astrocommunity.split-and-window.windows-nvim" },

  { import = "astrocommunity.terminal-integration.vim-tmux-yank" },

  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.vim-matchup" },
  { import = "astrocommunity.motion.nvim-spider" },
}
