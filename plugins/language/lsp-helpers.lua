return {
  {
    "rmagatti/goto-preview",
    event = "VeryLazy",
    config = function()
      require("goto-preview").setup({
        default_mappings = true,
      })
    end,
  },
  {
    "dnlhc/glance.nvim",
    event = "VeryLazy",
    config = function()
      require("glance").setup({})
      vim.keymap.set("n", "gD", "<CMD>Glance definitions<CR>")
      vim.keymap.set("n", "gR", "<CMD>Glance references<CR>")
      vim.keymap.set("n", "gY", "<CMD>Glance type_definitions<CR>")
      vim.keymap.set("n", "gM", "<CMD>Glance implementations<CR>")
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
    "eckon/treesitter-current-functions",
    -- dir = "~/Desktop/xlboy/__open-source__/treesitter-current-functions",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-telescope/telescope.nvim" },
  },
  {
    "niuiic/format.nvim",
    event = "VeryLazy",
    dependencies = { "niuiic/core.nvim" },
    config = function()
      require("format").setup({
        allow_update_if_buf_changed = false,
        -- function to calculate path of the temp file
        temp_file = function(file_path)
          local core = require("core")
          local new_file_path = core.file.dir(file_path)
            .. "/_"
            .. core.file.name(file_path)
            .. "."
            .. core.file.extension(file_path)
          return new_file_path
        end,
        hooks = {
          ---@type fun(code: integer, signal: integer) | nil
          on_success = function()
            vim.notify("Formatting Succeed", vim.log.levels.INFO, { title = "Format" })
          end,
          ---@type fun(err: string | nil, data: string | nil) | nil
          on_err = function()
            vim.notify("Formatting Failed", vim.log.levels.ERROR, { title = "Format" })
          end,
          on_timeout = function()
            vim.notify("Formatting Timeout", vim.log.levels.ERROR, { title = "Format" })
          end,
        },
        filetypes = {
          -- see format configuration below
          -- ...
          javascript = function(file_path)
            return {
              -- the first task
              ---@class format.config
              ---@field cmd string
              ---@field args string[]
              ---@field options {env?: table<string, any>, cwd?: string, uid?: number, gid?: number, verbatim?: boolean, detached?: boolean, hide?: boolean, timeout?: number} | nil
              ---@field on_success fun(code: integer, signal: integer) | nil
              ---@field on_err fun(err: string | nil, data: string | nil) | nil
              ---@field ignore_err (fun(err: string | nil, data: string | nil): boolean) | nil
              {
                cmd = "prettier",
                args = {
                  -- this plugin copies content of current buffer to a temporary file, and format this file, then write back to the buffer, thus, you need to make sure the formatter can write to the file
                  "-w",
                  file_path,
                },
                -- some formatters may output to stderr when formatted successfully, use this function to ignore these errors
                ignore_err = function(err, data)
                  return err == nil and data == nil
                end,
                on_err = function(err, data)
                  print(vim.inspect(err))
                  print(vim.inspect(data))
                end,
              },
            }
          end,
        },
      })
    end,
  },
}
