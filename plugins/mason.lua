-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "lua_ls",
        "stylelint_lsp",
        "angularls",
        "lua_ls",
        "cssls",
        "bashls",
        "emmet_ls",
        "eslint",
        "html",
        "intelephense",
        "stimulus_ls",
        "stylelint_lsp",
        "tailwindcss",
        "tsserver",
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        "prettierd",
        "stylua",
        "eslint_d",
        "codespell",
        "commitlint",
        "easy-coding-standard",
        "shellcheck",
        "beautysh",
      },
      handlers = {
        --   -- for prettier
        -- prettier = function()
        --   require("null-ls").register(require("null-ls").builtins.formatting.prettier.with {
        --     condition = function(utils)
        --       return utils.root_has_file "package.json"
        --         or utils.root_has_file ".prettierrc"
        --         or utils.root_has_file ".prettierrc.json"
        --         or utils.root_has_file ".prettierrc.js"
        --     end,
        --   })
        -- end,
        --   -- for prettierd
        prettierd = function()
          require("null-ls").register(require("null-ls").builtins.formatting.prettierd.with {
            condition = function(utils)
              return utils.root_has_file "package.json"
                or utils.root_has_file ".prettierrc"
                or utils.root_has_file ".prettierrc.json"
                or utils.root_has_file ".prettierrc.js"
            end,
          })
        end,
        --   -- For eslint_d:
        eslint_d = function()
          require("null-ls").register(require("null-ls").builtins.diagnostics.eslint_d.with {
            condition = function(utils)
              return utils.root_has_file "package.json"
                or utils.root_has_file ".eslintrc.json"
                or utils.root_has_file ".eslintrc.js"
                or utils.root_has_file "eslint.config.js"
            end,
          })
        end,
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      -- ensure_installed = { "python" },
    },
  },
}
