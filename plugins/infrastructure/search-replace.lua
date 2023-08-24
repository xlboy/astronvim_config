return {
  {
    "nvim-pack/nvim-spectre",
    event = "VeryLazy",
    config = function()
      require("spectre").setup({
        mapping = {
          ["send_to_qf"] = { map = "<leader>o" },
        },
      })
      vim.keymap.set("v", "<leader>sc", '<esc><cmd>lua require("spectre").open_file_search()<CR>')
      vim.keymap.set("v", "<leader>sa", '<esc><cmd>lua require("spectre").open_visual()<CR>')
    end,
    keys = {
      {
        "<leader>sa",
        function()
          require("spectre").open()
        end,
      },
      {
        "<leader>sc",
        function()
          require("spectre").open_file_search()
        end,
      },
    },
  },

  {
    "cshuaimin/ssr.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>sr",
        function()
          require("ssr").open()
        end,
        desc = "Search and replace",
      },
    },
    -- Calling setup is optional.
    config = function()
      require("ssr").setup({
        border = "rounded",
        min_width = 50,
        min_height = 5,
        max_width = 120,
        max_height = 25,
        keymaps = {
          close = "q",
          next_match = "n",
          prev_match = "N",
          replace_confirm = "<cr>",
          replace_all = "<leader><cr>",
        },
      })
    end,
  },
}
