return {
  {
    "gen740/SmoothCursor.nvim",
    enabled = false,
    config = function()
      require("smoothcursor").setup({
        fancy = {
          enable = true,
          head = { cursor = "🔞", texthl = "SmoothCursor", linehl = nil },
          body = {
            -- { cursor = "●", texthl = "SmoothCursorYellow" },
            -- { cursor = "●", texthl = "SmoothCursorGreen" },
            -- { cursor = "•", texthl = "SmoothCursorAqua" },
            -- { cursor = ".", texthl = "SmoothCursorBlue" },
            -- { cursor = ".", texthl = "SmoothCursorPurple" },
            -- { cursor = "❣" },
            { cursor = "💘" },
            { cursor = "💞" },
            { cursor = "💖" },
            { cursor = "💝" },
          },
        },
      })
    end,
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.animate",
    enabled = false,
    event = "VeryLazy",
    config = function()
      require("mini.animate").setup({
        scroll = {
          enable = true,
          timing = function(_, n)
            return 150 / n
          end,
        },
        cursor = { enable = false },
      })
    end,
  },
  {
    "gelguy/wilder.nvim",
    event = "CmdlineEnter",
    config = function()
      local wilder = require("wilder")
      wilder.setup({ modes = { ":", "/", "?" } })
      wilder.set_option(
        "renderer",
        wilder.renderer_mux({
          [":"] = wilder.popupmenu_renderer({
            highlighter = wilder.basic_highlighter(),
          }),
          ["/"] = wilder.wildmenu_renderer({
            highlighter = wilder.basic_highlighter(),
          }),
        })
      )
    end,
    dependencies = {
      "romgrk/fzy-lua-native",
      "lambdalisue/nerdfont.vim",
    },
  },
  {
    "koenverburg/peepsight.nvim",
    event = "VeryLazy",
    config = function()
      require("peepsight").setup({
        -- Lua
        "local_function_definition_statement",
        "function_definition_statement",

        -- TypeScript
        "class_declaration",
        "method_definition",
        "arrow_function",
        "function_declaration",
        "generator_function_declaration",
      })
      require("peepsight").enable()
    end,
  },
  -- {
  --   "folke/twilight.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     vim.cmd("TwilightEnable")
  --   end,
  -- },
}
