local t_builtin = require("telescope.builtin")
local t_extensions = require("telescope").extensions
local u_buffer = require("user.utils.buffer")

return {
  n = {
    ["ZZ"] = { "" },
    ["'d"] = { '"0d' },
    ["'c"] = { '"0c' },
    ["<S-w>"] = { "3w" },
    ["<S-b>"] = { "3b" },
    ["<leader>tt"] = { "<cmd>:TodoTelescope<CR>" },
    ["<leader>fml"] = { "<cmd>CellularAutomaton make_it_rain<CR>" },
    ["<leader>fmk"] = { "<cmd>CellularAutomaton game_of_life<CR>" },
    ["<leader>all"] = { "ggVG" },
    ["<leader>/"] = { t_builtin.live_grep },
    ["<leader>,"] = {
      function()
        local entry_display = require("telescope.pickers.entry_display")

        local displayer = entry_display.create({
          separator = " ",
          items = {
            { width = 30 },
            { remaining = true },
          },
        })
        local function make_display(entry)
          local dir_path = entry.is_root_file and "" or entry.dir_path
          return displayer({ entry.name, { dir_path, "Comment" } })
        end
        require("telescope.builtin").buffers({
          previewer = false,
          layout_config = {
            width = 70,
            height = 25,
          },
          path_display = function(opts, path)
            local tail = require("telescope.utils").path_tail(path)
            return string.format("%s (%s)", tail, vim.fn.fnamemodify(path, ":h")), { { { 1, #tail }, "Constant" } }
          end,
          -- entry_maker = function(entry)
          --   local file_name = vim.fn.fnamemodify(entry.info.name, ":t")
          --   local dir_path = vim.fn.fnamemodify(entry.info.name, ":h")
          --   local current_cwd = vim.fn.getcwd()
          --   local relative_dir_path = vim.fn.fnamemodify(dir_path, ":~:." .. current_cwd .. ":.")
          --   local is_root_file = dir_path == current_cwd
          --   local ordinal = file_name .. " " .. relative_dir_path
          --   if is_root_file then
          --     ordinal = file_name
          --   end
          --   print(dir_path .. "--" .. current_cwd)
          --   print(is_root_file)
          --   print(ordinal)
          --
          --   return {
          --     display = make_display,
          --     name = file_name,
          --     dir_path = relative_dir_path,
          --     is_root_file = is_root_file,
          --     value = entry,
          --     ordinal = ordinal,
          --   }
          -- end,
        })
      end,
      desc = "Find buffers",
    },
    ["<leader>fn"] = { "<CMD>GetCurrentFunctions<CR>" },
    ["<leader>fp"] = {
      function()
        t_extensions.projects.projects({
          layout_config = {
            width = 110,
            height = 25,
          },
        })
      end,
    },
    ["<S-h>"] = { "^" },
    ["<S-l>"] = { "$" },
    ["<S-k>"] = { "8k" },
    ["<S-j>"] = { "8j" },
    ["<S-u>"] = { "20k" },
    ["<S-d>"] = { "20j" },
    ["<leader><leader>"] = {
      function()
        t_extensions.smart_open.smart_open({
          previewer = false,
          layout_config = {
            width = 110,
            height = 25,
          },
        })
      end,
    },
    ["<C-c>"] = { "<cmd> %y+ <cr>", desc = "copy file" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    ["<leader>c"] = { "" },
    ["<leader>cc"] = {
      function()
        local bufs = vim.fn.getbufinfo({ buflisted = true })
        require("astronvim.utils.buffer").close(vim.api.nvim_get_current_buf())
        if require("astronvim.utils").is_available("alpha-nvim") and not bufs[2] then
          require("alpha").start(true)
        end
      end,
      desc = "Close buffer",
    },
    ["<leader>ca"] = {
      function()
        local bufs = vim.fn.getbufinfo({ buflisted = true })
        for _, buf in pairs(bufs) do
          require("astronvim.utils.buffer").close(buf.bufnr)
        end
        require("alpha").start(true)
      end,
      desc = "Close All buffer",
    },
    ["}"] = {
      function()
        local next_buf_pos = u_buffer.get_next_buf_position()
        if next_buf_pos ~= nil then
          local jump_step_number = 1
          local bufs = vim.fn.getbufinfo({ buflisted = true })
          local next_buf = bufs[next_buf_pos].bufnr
          if u_buffer.is_open(next_buf) then
            jump_step_number = 2
          end
          require("astronvim.utils.buffer").nav(jump_step_number)
        end
      end,
    },
    ["{"] = {
      function()
        local prev_buf_pos = u_buffer.get_prev_buf_position()
        if prev_buf_pos ~= nil then
          local jump_step_number = -1
          local bufs = vim.fn.getbufinfo({ buflisted = true })
          local prev_buf = bufs[prev_buf_pos].bufnr
          if u_buffer.is_open(prev_buf) then
            jump_step_number = -2
          end

          require("astronvim.utils.buffer").nav(jump_step_number)
        end
      end,
    },
  },
  i = {
    ["kj"] = { "<esc>" },
    ["jk"] = { "<esc>" },
    ["<C-;>"] = {
      function()
        local cmp = require("cmp")
        cmp.close()
      end,
    },
    ["<C-i>"] = {
      function()
        local cmp = require("cmp")
        cmp.complete()
      end,
    },
  },
  v = {
    ["<S-h>"] = { "^" },
    ["<S-l>"] = { "$" },
    ["<S-k>"] = { "8k" },
    ["<S-j>"] = { "8j" },
    ["<S-u>"] = { "20k" },
    ["<S-d>"] = { "20j" },
    ["'d"] = { '"0d' },
    ["'c"] = { '"0c' },
    ["<S-w>"] = { "3w" },
    ["<S-b>"] = { "3b" },
  },
  t = {},
}
