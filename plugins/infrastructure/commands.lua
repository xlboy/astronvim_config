return {
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
        desc = "Copy current file path (absolute)",
        cmd = function()
          local file_path = vim.api.nvim_buf_get_name(0)
          vim.fn.system("echo -n " .. file_path .. " | pbcopy")
        end,
      },
      {
        desc = "Copy current file path & line (relative to cwd)",
        cmd = function()
          local file_path = vim.api.nvim_buf_get_name(0)
          local relative_path = vim.fn.fnamemodify(file_path, ":~:." .. vim.fn.getcwd() .. ":.")
          local current_line = vim.api.nvim_win_get_cursor(0)[1]
          local file_path_and_line = relative_path .. ":" .. current_line
          vim.fn.system("echo -n " .. file_path_and_line .. " | pbcopy")
        end,
      },
      {
        desc = "Merge 2 lines",
        cmd = "<CMD>join<CR>",
      },
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
    }, { mode = command_center.mode.ADD })

    telescope.setup({
      extensions = {
        command_center = {
          components = {
            command_center.component.DESC,
            command_center.component.KEYS,
          },
          auto_replace_desc_with_cmd = false,
        },
      },
    })

    telescope.load_extension("command_center")
  end,
}
