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
    "Bekaboo/dropbar.nvim",
    enabled = false,
    event = "VeryLazy",
    keys = {
      {
        "<Leader>;",
        function()
          local api = require("dropbar.api")
          api.pick()
        end,
        desc = "Pick from a list of options",
      },
      {
        "[c",
        function()
          local api = require("dropbar.api")
          api.goto_context_start()
        end,
        desc = "Go to the start of the current context",
      },
      {
        "]c",
        function()
          local api = require("dropbar.api")
          api.goto_context_end()
        end,
        desc = "Go to the next context",
      },
    },
    config = function()
      require("dropbar").setup({
        sources = {
          path = {
            relative_to = function()
              return vim.api.nvim_buf_get_name(0)
            end,
          },
        },
      })
    end,
    -- config = true,
  },
}
