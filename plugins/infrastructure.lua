return {
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
    },
  },
  {
    "prochri/telescope-all-recent.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    event = "VeryLazy",
    config = function()
      require("telescope-all-recent").setup({
        database = {
          folder = vim.fn.stdpath("data"),
          file = "telescope-all-recent.sqlite3",
          max_timestamps = 10,
        },
        debug = false,
        scoring = {
          recency_modifier = { -- also see telescope-frecency for these settings
            [1] = { age = 240, value = 100 }, -- past 4 hours
            [2] = { age = 1440, value = 80 }, -- past day
            [3] = { age = 4320, value = 60 }, -- past 3 days
            [4] = { age = 10080, value = 40 }, -- past week
            [5] = { age = 43200, value = 20 }, -- past month
            [6] = { age = 129600, value = 10 }, -- past 90 days
          },
          -- how much the score of a recent item will be improved.
          boost_factor = 0.0001,
        },
        default = {
          disable = true, -- disable any unkown pickers (recommended)
          use_cwd = true, -- differentiate scoring for each picker based on cwd
          sorting = "recent", -- sorting: options: 'recent' and 'frecency'
        },
        pickers = { -- allows you to overwrite the default settings for each picker
          man_pages = { -- enable man_pages picker. Disable cwd and use frecency sorting.
            disable = false,
            use_cwd = false,
            sorting = "frecency",
          },

          -- change settings for a telescope extension.
          -- To find out about extensions, you can use `print(vim.inspect(require'telescope'.extensions))`
          -- ["extension_name#extension_method"] = {
          -- -- [...]
          -- },
        },
      })
    end,
  },
  ------------ Search & Replace [Start]--------------
  {
    "nvim-pack/nvim-spectre",
    event = "VeryLazy",
    config = function()
      require("spectre").setup({
        mapping = {
          ["send_to_qf"] = { map = "<leader>o" },
        },
      })
      vim.keymap.set("v", "<leader>sc", '<esc><cmd>lua require("spectre").open_file_search()<CR>')
      vim.keymap.set("v", "<leader>sa", '<esc><cmd>lua require("spectre").open_visual()<CR>')
    end,
    keys = {
      {
        "<leader>sa",
        function()
          require("spectre").open()
        end,
      },
      {
        "<leader>sc",
        function()
          require("spectre").open_file_search()
        end,
      },
    },
  },

  {
    "cshuaimin/ssr.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>sr",
        function()
          require("ssr").open()
        end,
        desc = "Search and replace",
      },
    },
    -- Calling setup is optional.
    config = function()
      require("ssr").setup({
        border = "rounded",
        min_width = 50,
        min_height = 5,
        max_width = 120,
        max_height = 25,
        keymaps = {
          close = "q",
          next_match = "n",
          prev_match = "N",
          replace_confirm = "<cr>",
          replace_all = "<leader><cr>",
        },
      })
    end,
  },
  ------------ Search & Replace [End]--------------
  {
    "FeiyouG/command_center.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      {
        "<leader>pp",
        function()
          vim.cmd([[Telescope command_center]])
        end,
        desc = "Command Center",
      },
    },

    lazy = true,
    config = function()
      local telescope = require("telescope")
      local command_center = require("command_center")

      local plugins = require("lazy").plugins()

      for _, plugin in ipairs(plugins) do
        if plugin.command_center then
          -- only add for enabled plugins
          -- copied from require('lazy.core.plugin').Spec:fix_disabled
          local enabled = not (plugin.enabled == false or (type(plugin.enabled) == "function" and not plugin.enabled()))

          if enabled then
            command_center.add(plugin.command_center)
          end
        end
      end

      command_center.add({
        {
          desc = "Restart lsp server",
          cmd = "<CMD>LspRestart<CR>",
        },
        {
          desc = "Reload Buffer",
          cmd = "<CMD>bufdo e<CR>zz",
        },
        {
          desc = "Reload Window",
          cmd = "<CMD>windo e<CR>zz",
        },
        {
          desc = "Advanced git search",
          cmd = "<CMD>AdvancedGitSearch<CR>",
        },
        {
          desc = "Refresh TSHighlight",
          cmd = function()
            vim.cmd([[TSDisable highlight]])
            vim.cmd([[TSEnable highlight]])
          end,
        },
        -- {
        --   desc = "Reload plugins host",
        --   cmd = function()
        --     local plugins = require("lazy").plugins()
        --
        --     for _, plugin in ipairs(plugins) do
        --       vim.cmd("Lazy reload " .. plugin.name)
        --     end
        --   end,
        -- },
      }, { mode = command_center.mode.ADD })

      telescope.setup({
        extensions = {
          command_center = {
            components = {
              command_center.component.DESC,
              command_center.component.KEYS,
            },
            -- sort_by = {
            --   command_center.component.DESCRIPTION,
            --   command_center.component.KEYS,
            -- },
            auto_replace_desc_with_cmd = false,
          },
        },
      })

      telescope.load_extension("command_center")
    end,
  },
}
