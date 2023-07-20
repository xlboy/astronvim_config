return {
  {
    "jose-elias-alvarez/typescript.nvim", -- add lsp plugin
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "tsserver" }, -- automatically install lsp
      },
    },
  },
  {
    "sigmasd/deno-nvim", -- add lsp plugin
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "denols" }, -- automatically install lsp
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      handlers = {
        -- for prettier
        -- prettier = function()
        --   require("null-ls").register(require("null-ls").builtins.formatting.prettier.with {
        --     condition = function(utils)
        --       return utils.root_has_file "package.json"
        --           or utils.root_has_file ".prettierrc"
        --           or utils.root_has_file ".prettierrc.json"
        --           or utils.root_has_file ".prettierrc.js"
        --     end,
        --   })
        -- end,
        -- for prettierd
        -- prettierd = function()
        --   require("null-ls").register(require("null-ls").builtins.formatting.prettierd.with {
        --     condition = function(utils)
        --       return utils.root_has_file "package.json"
        --         or utils.root_has_file ".prettierrc"
        --         or utils.root_has_file ".prettierrc.json"
        --         or utils.root_has_file ".prettierrc.js"
        --     end,
        --   })
        -- end,
        -- For eslint_d:
        eslint_d = function()
          require("null-ls").register(require("null-ls").builtins.formatting.eslint_d.with {
            condition = function(utils)
              return utils.root_has_file "package.json"
                or utils.root_has_file ".eslintrc.json"
                or utils.root_has_file ".eslintrc.js"
            end,
          })
          require("null-ls").register(require("null-ls").builtins.diagnostics.eslint_d.with {
            condition = function(utils)
              return utils.root_has_file "package.json"
                or utils.root_has_file ".eslintrc.json"
                or utils.root_has_file ".eslintrc.js"
            end,
          })
        end,
      },
    },
  },
  {
    "simrat39/rust-tools.nvim", -- add lsp plugin
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "rust_analyzer" },
      },
    },
  },
}
