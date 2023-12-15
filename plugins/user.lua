return {
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "tpope/vim-fugitive",
    event = "User AstroGitFile",
    cmd = { "Git" },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "User AstroFile",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
