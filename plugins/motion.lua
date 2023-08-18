return {
  {
    "xlboy/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      modes = {
        search = {
          enabled = false,
        },
        char = {
          enabled = false,
        },
      },
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump {
            search = { mode = "fuzzy" },
          }
        end,
      },
      {
        "<leader>ssv",
        mode = { "n", "o", "x" },
        function() require("flash").treesitter_search() end,
      },
      {
        "<leader>sv",
        mode = { "n", "o", "x" },
        function() require("flash").treesitter() end,
      },
      {
        "<leader>k",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump {
            search = { mode = "search", max_length = 0, forward = false, wrap = false, multi_window = false },
            label = { after = { 0, 0 } },
            pattern = "^",
          }
        end,
      },
      {
        "<leader>j",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump {
            search = { mode = "search", max_length = 0, forward = true, wrap = false, multi_window = false },
            label = { after = { 0, 0 } },
            pattern = "^",
          }
        end,
      },
    },
  },
  {
    "chaoren/vim-wordmotion",
    event = "VeryLazy",
    init = function() vim.g.wordmotion_prefix = ';' end,
  },
}
