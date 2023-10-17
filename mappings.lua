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
    ["<leader>tud"] = { ":Telescope undo<CR>" },
    ["<leader>jo"] = { "<CMD>join<CR>" },
    ["<leader>tt"] = { "<cmd>:TodoTelescope<CR>" },
    ["<leader>fml"] = { "<cmd>CellularAutomaton make_it_rain<CR>" },
    ["<leader>fmk"] = { "<cmd>CellularAutomaton game_of_life<CR>" },
    ["<leader>all"] = { "ggVG" },
    ["<leader>/"] = { t_builtin.live_grep },
    ["<leader>,"] = {
      function()
        require("telescope.builtin").buffers({
          previewer = false,
          layout_config = { width = 70, height = 25 },
          path_display = function(opts, path)
            local tail = require("telescope.utils").path_tail(path)
            return string.format("%s (%s)", tail, vim.fn.fnamemodify(path, ":h")), { { { 1, #tail }, "Constant" } }
          end,
        })
      end,
      desc = "Find buffers",
    },
    ["<leader>fpr"] = {
      function()
        t_extensions["neovim-project"].history({
          layout_config = { width = 110, height = 25 },
        })
      end,
    },
    ["<leader>fpa"] = {
      function()
        t_extensions["neovim-project"].discover({
          layout_config = { width = 110, height = 25 },
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
          layout_config = { width = 110, height = 25 },
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
        require("astronvim.utils.buffer").nav(1)
      end,
    },
    ["{"] = {
      function()
        require("astronvim.utils.buffer").nav(-1)
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
    ["y"] = {
      '"+ygv<esc>',
    },
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
