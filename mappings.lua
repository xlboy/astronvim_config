-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local neoscroll = require "neoscroll"

return {
  -- first key is the mode
  n = {
    ["<leader>fml"] = { "<cmd>CellularAutomaton make_it_rain<CR>" },
    ["<leader>fmk"] = { "<cmd>CellularAutomaton game_of_life<CR>" },
    ["'d"] = { '"0d' },
    ["'c"] = { '"0c' },
    ["<leader><leader>"] = {
      function() require("telescope.builtin").find_files() end,
      desc = "Find files",
    },
    ["<leader>/"] = {
      function() require("telescope.builtin").live_grep() end,
      desc = "Find words",
    },
    ["<leader>,"] = {
      function() require("telescope.builtin").buffers() end,
      desc = "Find buffers",
    },
    ["<S-h>"] = { "^" },
    ["<S-l>"] = { "$" },

    ["<S-k>"] = { "8k" },
    ["<S-j>"] = { "8j" },
    ["<S-u>"] = { "20k" },
    ["<S-d>"] = { "20j" },

    -- ["<S-k>"] = { function() neoscroll.scroll(-8, true, 120) end },
    -- ["<S-j>"] = { function() neoscroll.scroll(8, true, 120) end },
    -- ["<S-u>"] = { function() neoscroll.scroll(-20, true, 200) end },
    -- ["<S-d>"] = { function() neoscroll.scroll(20, true, 200) end },
    -- ["<S-j>"] = { ":call smooth_scroll#down(8, 20, 2)<CR>" },
    -- ["<S-k>"] = { ":call smooth_scroll#up(8, 20, 2)<CR>" },
    -- ["<S-u>"] = { ":call smooth_scroll#up(20, 20, 2)<CR>" },
    -- ["<S-d>"] = { ":call smooth_scroll#down(20, 20, 2)<CR>" },
    -- ["<leader>/"] = {
    --   function() require("telescope.builtin").live_grep() end,
    --   desc = "Find words",
    -- },
    -- ["<leader>,"] = {
    --   function() require("telescope.builtin").buffers() end,
    --   desc = "Find buffers",
    -- },
    ["<C-c>"] = { "<cmd> %y+ <cr>", desc = "copy file" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
    ["]w"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["[w"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous tab",
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
  },
  t = {},
}
