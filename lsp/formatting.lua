return {
  format_on_save = {
    enabled = true,
    allow_filetypes = {},
    ignore_filetypes = { "php" },
  },
  disabled = {},
  timeout_ms = 1000,
  filter = function(client)
    -- if vim.bo.filetype == "javascript" then return client.name == "null-ls" end

    if vim.bo.filetype == "scss" then return client.name == "stylelint_lsp" end
    if vim.bo.filetype == "css" then return client.name == "stylelint_lsp" end

    return true
  end,
}
