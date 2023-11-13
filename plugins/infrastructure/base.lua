return {
  {
    "xlboy/telescope-recent-files",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("recent_files")
    end,
    dependencies = { "kkharji/sqlite.lua" },
  },
  {
    "coffebar/neovim-project",
    init = function()
      vim.opt.sessionoptions:append("globals")
      require("telescope").load_extension("neovim-project")
      require("neovim-project").setup({
        projects = {
          "~/.config/nvim",
          "~/.config/nvim/lua/user",
          "~/Desktop/lilith/*",
          "~/Desktop/lilith/__temp__/*",
          "~/Desktop/xlboy/*",
          "~/Desktop/xlboy-project/*",
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
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "Marskey/telescope-sg",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("ast_grep")
      require("telescope").setup({
        extensions = {
          ast_grep = {
            command = {
              "sg",
              "--json=stream",
            }, -- must have --json=stream
            grep_open_files = false, -- search in opened files
            lang = nil, -- string value, specify language for ast-grep `nil` for default
          },
        },
      })
    end,
    keys = {
      { "<leader>fsg", "<CMD>Telescope ast_grep<CR>", desc = "Telescope ast_grep" },
    },
  },
}
