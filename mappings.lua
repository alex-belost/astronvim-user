return {
  n = {
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
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
    ["<leader><space>"] = { function() require("telescope.builtin").buffers() end, desc = "Search buffers" },
    ["<leader>c"] = {
      function()
        local bufs = vim.fn.getbufinfo { buflisted = true }

        require("astronvim.utils.buffer").close(0)

        if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
      end,
      desc = "Close buffer",
    },
    ["<leader>m"] = { name = " Bookmarks" },
    ["<leader>ma"] = {
      function() require("harpoon.mark").add_file() end,
      desc = "Add file",
    },
    ["<leader>mm"] = {
      function() require("harpoon.ui").toggle_quick_menu() end,
      desc = "Toggle quick menu",
    },
    ["<leader>m1"] = {
      function() require("harpoon.ui").nav_file(1) end,
      desc = "Go to mark 1",
    },
    ["<leader>m2"] = {
      function() require("harpoon.ui").nav_file(2) end,
      desc = "Go to mark 2",
    },
    ["<leader>m3"] = {
      function() require("harpoon.ui").nav_file(3) end,
      desc = "Go to mark 3",
    },
    ["<leader>m4"] = {
      function() require("harpoon.ui").nav_file(4) end,
      desc = "Go to mark 4",
    },
    ["<leader>mh"] = {
      function() require("harpoon.ui").nav_next() end,
      desc = "Go to next",
    },
    ["<leader>ml"] = {
      function() require("harpoon.ui").nav_prev() end,
      desc = "Go to prev",
    },
    ["<leader>fb"] = {
      "<cmd>Neotree reveal_force_cwd<cr>",
      desc = "Find in tree",
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
