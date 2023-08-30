return {
  {
    "rmagatti/goto-preview",
    event = "VeryLazy",
    config = function()
      require("goto-preview").setup({
        default_mappings = true,
      })
    end,
  },
  {
    "dnlhc/glance.nvim",
    event = "VeryLazy",
    config = function()
      require("glance").setup({})
      vim.keymap.set("n", "gD", "<CMD>Glance definitions<CR>")
      vim.keymap.set("n", "gR", "<CMD>Glance references<CR>")
      vim.keymap.set("n", "gY", "<CMD>Glance type_definitions<CR>")
      vim.keymap.set("n", "gM", "<CMD>Glance implementations<CR>")
    end,
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
  {
    "eckon/treesitter-current-functions",
    -- dir = "~/Desktop/xlboy/__open-source__/treesitter-current-functions",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-telescope/telescope.nvim" },
  },
  {
    "KostkaBrukowa/definition-or-references.nvim",
    event = "VeryLazy",
    config = function()
      vim.keymap.set("n", "gd", require("definition-or-references").definition_or_references, { silent = true })
    end,
  },
  {
    "marilari88/twoslash-queries.nvim",
    event = "VeryLazy",
    config = function()
      require("lspconfig")["tsserver"].setup({
        on_attach = function(client, bufnr)
          require("twoslash-queries").attach(client, bufnr)
        end,
      })
      require("twoslash-queries").setup({
        multi_line = true, -- to print types in multi line mode
        is_enabled = false, -- to keep disabled at startup and enable it on request with the TwoslashQueriesEnable
        highlight = "Type", -- to set up a highlight group for the virtual text
      })
    end,
  },
}
