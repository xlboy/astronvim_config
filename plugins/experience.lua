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
        "function_definition",
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
  {
    "Pocco81/true-zen.nvim",
    keys = { { "<leader>tzn", ":TZNarrow<CR>", mode = { "v" } } },
    config = function()
      require("true-zen").setup({})
    end,
  },
  {
    dir = "~/Desktop/xlboy/function-picker.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-telescope/telescope.nvim" },
    keys = {
      {
        "<leader>fns",
        function()
          require("function-picker").show({
            deep = {
              mode = "flat",
              tree_contour_opts = { indent = 2 },
              flat_opts = { space_character = " 🌀 " },
            },
          })
        end,
        mode = { "n" },
      },
    },
  },
  {
    "AckslD/nvim-FeMaco.lua",
    event = "VeryLazy",
    config = function()
      require("femaco").setup()
    end,
  },
  {
    "Wansmer/symbol-usage.nvim",
    event = "BufReadPre",
    config = function()
      require("symbol-usage").setup({
        vt_position = "end_of_line",
        text_format = function(symbol)
          local fragments = {}

          if symbol.references then
            local usage = symbol.references <= 1 and "" or "usages"
            local num = symbol.references == 0 and "" or symbol.references
            table.insert(fragments, ("%s %s"):format(num, usage))
          end

          if symbol.definition then
            table.insert(fragments, symbol.definition .. " defs")
          end

          if symbol.implementation then
            table.insert(fragments, symbol.implementation .. " impls")
          end

          return table.concat(fragments, ", ")
        end,
      })
    end,
  },
}
