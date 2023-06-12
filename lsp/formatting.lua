return {
  -- control auto formatting on save
  format_on_save = {
    enabled = true, -- enable or disable format on save globally
    allow_filetypes = { -- enable format on save for specified filetypes only
      -- "go",
    },
    ignore_filetypes = { -- disable format on save for specified filetypes
      -- "python",
    },
  },
  disabled = { -- disable formatting capabilities for the listed language servers
    -- "sumneko_lua",
  },
  timeout_ms = 1000, -- default format timeout
  filter = function(client) -- fully override the default formatting function
    -- if vim.bo.filetype == "typescript" then return client.name == "null-ls" end

    -- if vim.bo.filetype == "scss" then return client.name == "stylelint_lsp" end

    return true
  end,
}
