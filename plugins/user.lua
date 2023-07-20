return {
  {
    "mg979/vim-visual-multi",
    keys = {
      { "<C-n>", mode = { "n", "x" } },
    },
  },
  {
    "andrewferrier/debugprint.nvim",
    keys = {
      { "g?p", desc = "Print debug info" },
      { "g?v", desc = "Print selection debug info", mode = "v" },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function() require("debugprint").setup() end,
    version = "*",
  },
  {
    "smjonas/live-command.nvim",
    cmd = { "Norm" },
    config = function()
      require("live-command").setup {
        commands = {
          Norm = { cmd = "norm" },
        },
      }
    end,
  },
  {
    "jxnblk/vim-mdx-js",
  },
  {
    "dpayne/CodeGPT.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Chat",
    config = function()
      require "codegpt.config"
      vim.g["codegpt_openai_api_key"] = os.getenv "OPENAI_SB_API_KEY"
      vim.g["codegpt_openai_api_provider"] = "OpenAI"
      vim.g["codegpt_chat_completions_url"] = "https://api.openai-sb.com/v1/chat/completions"
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    opts = {
      handlers = {
        cursor = false,
      },
    },
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = "Neogen",
    keys = {
      { "gdd", function() require("neogen").generate() end, desc = "Neogen" },
    },
    config = true,
  },
}
