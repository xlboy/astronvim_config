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
            -- { cursor = "💚", texthl = "SmoothCursorPurple" },
            -- { cursor = "💙", texthl = "SmoothCursorPurple" },
          },
        },
      })
    end,
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.animate",
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
}
