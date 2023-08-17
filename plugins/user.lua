return {
  {
    "petertriho/nvim-scrollbar",
    enabled = false,
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
          timing = function(_, n) return 150 / n end,
        },
        cursor = {
          enable = false,
        },
      }
    end,
  },
  { "chaoren/vim-wordmotion", event = "VeryLazy" },
  {
    "xlboy/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      modes = {
        search = {
          enabled = false
        },
        char = {
          enabled = false,
        },
      },
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      {
        "S",
        mode = { "n", "x", "o" }, 
        function()
          require("flash").jump{
            search = { mode = "fuzzy" }
          }
        end
      },
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
            pattern = "^",
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
            pattern = "^",
          }
        end,
      },
    },
  },
  { "wellle/targets.vim", event = "VeryLazy" },
  {
    "shellRaining/hlchunk.nvim",
    event = "UIEnter",
    init = function()
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, { pattern = "*", command = "EnableHL" })

      require("hlchunk").setup {
        chunk = {
          enable = true,
          use_treesitter = true,
          style = {
            { fg = "#73daca" },
          },
        },
        indent = {
          enable = false,
          chars = { "." },
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
      }
    end,
  },
  {
    'tamton-aquib/duck.nvim',
    event = "VeryLazy",
    config = function()
      vim.keymap.set('n', '<leader>dd', function() require("duck").hatch() end, {})
      vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
    end
  },
  {
    'rmagatti/goto-preview',
    event = "VeryLazy",
    config = function()
      require('goto-preview').setup {
        default_mappings = true
      }
    end
  },
  {
    'tomasky/bookmarks.nvim',
    -- after = "telescope.nvim",
    event = "VeryLazy",
    enabled = false,
    config = function()
      vim.opt.signcolumn = "yes:2"
      require("bookmarks").setup({
        save_file = vim.fn.expand("$HOME/.local/share/nvim/bookmarks"), -- bookmarks save file path
        keywords = {
          ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
          ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
          ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
          ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
        },
        on_attach = function(bufnr)
          local bm = require("bookmarks")
          local map = vim.keymap.set
          map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
          map("n", "mi", bm.bookmark_ann) -- add or edit mark annotation at current line
          map("n", "mc", bm.bookmark_clean) -- clean all marks in local buffer
          map("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
          map("n", "mp", bm.bookmark_prev) -- jump to previous mark in local buffer
          map("n", "ml", bm.bookmark_list) -- show marked file list in quickfix window
        end,
      })
    end
  },
  {
    "dnlhc/glance.nvim",
    event = "VeryLazy",
    config = function()
      require('glance').setup{}
      vim.keymap.set("n", "gD", "<CMD>Glance definitions<CR>")
      vim.keymap.set("n", "gR", "<CMD>Glance references<CR>")
      vim.keymap.set("n", "gY", "<CMD>Glance type_definitions<CR>")
      vim.keymap.set("n", "gM", "<CMD>Glance implementations<CR>")
    end,
  },
  {
    "andymass/vim-matchup",
    event = "VeryLazy",
    config = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
      require("nvim-treesitter.configs").setup({
        matchup = {
          enable = true,        
        },
      })
    end
  },
  {
    "xlboy/text-case.nvim",
    -- dir = "~/Desktop/xlboy/__open-source__/text-case.nvim",

    event = "BufRead",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("textcase").setup({})
      require("telescope").load_extension("textcase")

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
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("smart_open")
    end,
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
    config = function()
      require("telescope-all-recent").setup({})
    end,
  },
  {
   "TobinPalmer/rayso.nvim",
    cmd = "Rayso",
    config = function()
      require("rayso").setup({
        open_cmd = "Arc",
        options = {
          theme = 'breeze',
          padding = 16,
        }
      })
    end,
  },
  {
    "elijahmanor/export-to-vscode.nvim",
    event = "BufReadPost",
    config = function()
      vim.keymap.set('n', '<leader>vsc', require("export-to-vscode").launch, {})
    end,
  },
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    init = function()
      vim.cmd([[
        let g:VM_mouse_mappings = 1
        " let g:VM_leader = 'm'
      ]])
    end
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
    "gbprod/cutlass.nvim",
    event = "VeryLazy",
    opts = { cut_key = "x" },
  },
  {
    "gelguy/wilder.nvim",
    event = "CmdlineEnter",
    config = function()
      local wilder = require('wilder')
      wilder.setup({modes = {':', '/', '?'}})
      wilder.set_option('renderer', wilder.popupmenu_renderer({
        pumblend = 20,
      }))
    end,
    dependencies = { "romgrk/fzy-lua-native" },
  },
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    keys = {
      {
        "<leader>sr",
        function()
          require("spectre").open()
        end,
        desc = "Replace in files (Spectre)",
      },
      {
        "<leader>sp",
        function()
          require("spectre").open_file_search({ select_word = true })
        end,
        desc = "Search on current file",
      },
    },
  }
}

