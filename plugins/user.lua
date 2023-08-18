return {
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = "Neogen",
    keys = {
      { "gdd", function() require("neogen").generate {} end, desc = "Neogen" },
    },
    config = true,
  },
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
  -- ........................
  -- { "karb94/neoscroll.nvim", event = "VeryLazy", config = function() require("neoscroll").setup() end },
  { "itchyny/vim-cursorword", event = "VeryLazy" },
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
    "chaoren/vim-wordmotion",
    event = "VeryLazy",
    init = function() vim.g.wordmotion_prefix = ';' end,
  },
  { "wellle/targets.vim", event = "VeryLazy" },
  {
    "tomasky/bookmarks.nvim",
    -- after = "telescope.nvim",
    event = "VeryLazy",
    enabled = false,
    config = function()
      vim.opt.signcolumn = "yes:2"
      require("bookmarks").setup {
        save_file = vim.fn.expand "$HOME/.local/share/nvim/bookmarks", -- bookmarks save file path
        keywords = {
          ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
          ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
          ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
          ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
        },
        on_attach = function(bufnr)
          local bm = require "bookmarks"
          local map = vim.keymap.set
          map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
          map("n", "mi", bm.bookmark_ann) -- add or edit mark annotation at current line
          map("n", "mc", bm.bookmark_clean) -- clean all marks in local buffer
          map("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
          map("n", "mp", bm.bookmark_prev) -- jump to previous mark in local buffer
          map("n", "ml", bm.bookmark_list) -- show marked file list in quickfix window
        end,
      }
    end,
  },
  {
    "xlboy/text-case.nvim",
    -- dir = "~/Desktop/xlboy/__open-source__/text-case.nvim",
    event = "BufRead",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("textcase").setup {}
      require("telescope").load_extension "textcase"

      vim.api.nvim_set_keymap("n", "ga.", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
      vim.api.nvim_set_keymap("v", "ga.", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
      vim.api.nvim_set_keymap(
        "n",
        "gaa",
        "<cmd>TextCaseOpenTelescopeQuickChange<CR>",
        { desc = "Telescope Quick Change" }
      )
      vim.api.nvim_set_keymap("n", "gai", "<cmd>TextCaseOpenTelescopeLSPChange<CR>", { desc = "Telescope LSP Change" })
    end,
  },
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    event = "VeryLazy",
    config = function() require("telescope").load_extension "smart_open" end,
    dependencies = {
      "kkharji/sqlite.lua",
      "nvim-telescope/telescope.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
      -- { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  },
  {
    "prochri/telescope-all-recent.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    event = "VeryLazy",
    config = function() require("telescope-all-recent").setup {} end,
  },
  {
    "TobinPalmer/rayso.nvim",
    cmd = "Rayso",
    config = function()
      require("rayso").setup {
        open_cmd = "Arc",
        options = {
          theme = "breeze",
          padding = 16,
        },
      }
    end,
  },
  {
    "elijahmanor/export-to-vscode.nvim",
    event = "BufReadPost",
    config = function() vim.keymap.set("n", "<leader>vsc", require("export-to-vscode").launch, {}) end,
  },
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    init = function() vim.g.VM_mouse_mappings = 1 end,
  },
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
  },
  {
    "folke/todo-comments.nvim",
    opts = {},
    event = "VeryLazy",
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
  },
  {
    "nvim-pack/nvim-spectre",
    event = "VeryLazy",
    config = function()
      require("spectre").setup {
        mapping = {
          ["send_to_qf"] = { map = "<leader>o" },
        },
      }
      vim.keymap.set("v", "<leader>sc", '<esc><cmd>lua require("spectre").open_file_search()<CR>')
      vim.keymap.set("v", "<leader>sa", '<esc><cmd>lua require("spectre").open_visual()<CR>')
    end,
    keys = {
      { "<leader>sa", function() require("spectre").open() end },
      { "<leader>sc", function() require("spectre").open_file_search() end },
    },
  },
}
