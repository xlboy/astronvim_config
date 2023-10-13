return {
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("smart_open")
    end,
    dependencies = {
      "kkharji/sqlite.lua",
      "nvim-telescope/telescope.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },
  {
    "coffebar/neovim-project",
    init = function()
      vim.opt.sessionoptions:append("globals")
      require("telescope").load_extension("neovim-project")
      require("neovim-project").setup({
        projects = {
          "~/.config/nvim/lua/user",
          "~/Desktop/lilith/*",
          "~/Desktop/xlboy/*",
          "~/Desktop/xlboy/__open-source__/*",
        },
        datapath = vim.fn.stdpath("data"),
      })
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "Shatur/neovim-session-manager" },
    },
  },
}
