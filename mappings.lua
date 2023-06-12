return {
  n = {
    ["<leader>n"] = false,
    ["<leader>bo"] = { "<cmd>Neotree focus filesystem left reveal<cr>", desc = "Open current file"},
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<Tab>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-Tab>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["<leader>c"] = {
      function()
        local bufs = vim.fn.getbufinfo { buflisted = true }

        require("astronvim.utils.buffer").close(0)

        if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
      end,
      desc = "Close buffer",
    },
    ["<leader>T"] = { name = " TODO's" },
    ["<leader>Tf"] = {
      "<cmd>TodoTelescope<cr>",
      desc = "Find TODO's",
    },
    ["<leader>Tt"] = {
      "<cmd>TodoTrouble<cr>",
      desc = "Trouble Trouble",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
