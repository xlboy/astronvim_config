return {
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    event = "VeryLazy",
    config = function() require("telescope").load_extension "smart_open" end,
    dependencies = {
      "kkharji/sqlite.lua",
      "nvim-telescope/telescope.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },
  {
    "prochri/telescope-all-recent.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    event = "VeryLazy",
    config = function() require("telescope-all-recent").setup {} end,
  },
  {
    "nvim-pack/nvim-spectre",
    event = "VeryLazy",
    config = function()
      require("spectre").setup {
        mapping = {
          ["send_to_qf"] = { map = "<leader>o" },
        },
      }
      vim.keymap.set("v", "<leader>sc", '<esc><cmd>lua require("spectre").open_file_search()<CR>')
      vim.keymap.set("v", "<leader>sa", '<esc><cmd>lua require("spectre").open_visual()<CR>')
    end,
    keys = {
      { "<leader>sa", function() require("spectre").open() end },
      { "<leader>sc", function() require("spectre").open_file_search() end },
    },
  }
}
