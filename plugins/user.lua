return {
  -- {
  --   "smjonas/live-command.nvim",
  --   cmd = { "Norm" },
  --   config = function()
  --     require("live-command").setup {
  --       commands = {
  --         Norm = { cmd = "norm" },
  --       },
  --     }
  --   end,
  -- },
  -- { "jxnblk/vim-mdx-js" },
  -- {
  --   "dpayne/CodeGPT.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --   },
  --   cmd = "Chat",
  --   config = function()
  --     require "codegpt.config"
  --     vim.g["codegpt_openai_api_key"] = os.getenv "OPENAI_SB_API_KEY"
  --     vim.g["codegpt_openai_api_provider"] = "OpenAI"
  --     vim.g["codegpt_chat_completions_url"] = "https://api.openai-sb.com/v1/chat/completions"
  --   end,
  -- },
  {
    "petertriho/nvim-scrollbar",
    opts = {
      handlers = {
        cursor = false,
      },
    },
  },
  -- {
  --   "danymat/neogen",
  --   dependencies = "nvim-treesitter/nvim-treesitter",
  --   cmd = "Neogen",
  --   keys = {
  --     { "gdd", function() require("neogen").generate {} end, desc = "Neogen" },
  --   },
  --   config = true,
  -- },
  {
    "echasnovski/mini.surround",
    keys = {
      { "gza", desc = "Add surrounding", mode = { "n", "v" } },
      { "gzd", desc = "Delete surrounding" },
      { "gzf", desc = "Find right surrounding" },
      { "gzF", desc = "Find left surrounding" },
      { "gzh", desc = "Highlight surrounding" },
      { "gzr", desc = "Replace surrounding" },
      { "gzn", desc = "Update `MiniSurround.config.n_lines`" },
    },
    opts = {
      mappings = {
        add = "gza",
        delete = "gzd",
        find = "gzf",
        find_left = "gzF",
        highlight = "gzh",
        replace = "gzr",
        update_n_lines = "gzn",
      },
    },
  },
  {
    "debugloop/telescope-undo.nvim",
    keys = {
      { "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Find undo" },
    },
  },
  -- ........................
  -- { "karb94/neoscroll.nvim", event = "VeryLazy", config = function() require("neoscroll").setup() end },
  -- { "itchyny/vim-cursorword", event = "VeryLazy" },
  {
    "gen740/SmoothCursor.nvim",
    config = function()
      require("smoothcursor").setup {
        cursor = "",
        fancy = {
          enable = true,
        },
      }
    end,
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.animate",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.animate").setup {
        scroll = {
          enable = true,
          timing = function(_, n) return 100 / n end,
        },
        cursor = {
          enable = true,
          timing = function(_, n) return 100 / n end,
        },
      }
    end,
  },
  { "chaoren/vim-wordmotion", event = "VeryLazy" },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      modes = {
        char = {
          enabled = false,
        },
      },
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      {
        "<leader>lv",
        mode = { "n", "o", "x" },
        function() require("flash").treesitter() end,
        desc = "Flash Treesitter",
      },
      {
        "<leader>k",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump {
            search = { mode = "search", max_length = 0, forward = false, wrap = false, multi_window = false },
            label = { after = { 0, 0 } },
            pattern = "[^ ]*.",
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
            pattern = "[^ ]*.",
          }
        end,
      },
    },
  },
  { "wellle/targets.vim", event = "VeryLazy" },
}
