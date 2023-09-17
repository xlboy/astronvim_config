return {
  {
    "shellRaining/hlchunk.nvim",
    event = "UIEnter",
    init = function()
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, { pattern = "*", command = "EnableHL" })

      require("hlchunk").setup({
        chunk = {
          enable = true,
          use_treesitter = true,
          style = {
            { fg = "#73daca" },
          },
        },
        indent = {
          enable = false,
          chars = { "·" },
          use_treesitter = false,
          style = {
            {},
          },
        },
        blank = {
          enable = false,
        },
        line_num = {
          enable = false,
        },
      })
    end,
  },
  { "itchyny/vim-cursorword", event = "VeryLazy" },
  {
    "kevinhwang91/nvim-hlslens",
    event = "VeryLazy",
    config = function()
      require("hlslens").setup()
    end,
  },
  {
    "utilyre/sentiment.nvim",
    version = "*",
    event = "VeryLazy", -- keep for lazy loading
    opts = {},
    init = function()
      vim.g.loaded_matchparen = 1
    end,
  },
}
