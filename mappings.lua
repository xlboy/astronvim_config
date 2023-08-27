local tBuiltin = require("telescope.builtin")
local tExtensions = require("telescope").extensions

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
    ["<leader>/"] = { tBuiltin.live_grep },
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
        tExtensions.projects.projects({
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
        tExtensions.smart_open.smart_open({
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
    ["}"] = {
      function()
        require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
      end,
    },
    ["{"] = {
      function()
        require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
      end,
    },
  },
  i = {
    ["kj"] = { "<esc>" },
    ["jk"] = { "<esc>" },
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
