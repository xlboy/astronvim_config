return {
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
}
