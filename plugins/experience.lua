return {
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
          timing = function(_, n) return 150 / n end,
        },
        cursor = { enable = false },
      }
    end,
  },
  {
    "gelguy/wilder.nvim",
    event = "CmdlineEnter",
    config = function()
      local wilder = require "wilder"
      wilder.setup { modes = { ":", "/", "?" } }
      wilder.set_option(
        "renderer",
        wilder.renderer_mux {
          [":"] = wilder.popupmenu_renderer {
            highlighter = wilder.basic_highlighter(),
          },
          ["/"] = wilder.wildmenu_renderer {
            highlighter = wilder.basic_highlighter(),
          },
        }
      )
    end,
    dependencies = {
      "romgrk/fzy-lua-native",
      "lambdalisue/nerdfont.vim",
    },
  }
}
