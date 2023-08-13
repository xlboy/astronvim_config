return {
  n = {
    ["<leader>fml"] = { "<cmd>CellularAutomaton make_it_rain<CR>" },
    ["<leader>fmk"] = { "<cmd>CellularAutomaton game_of_life<CR>" },
    ["<leader>sa"] = { "ggVG" },
    ["'d"] = { '"0d' },
    ["'c"] = { '"0c' },
    -- ["<leader><leader>"] = {
    --   function() require("telescope.builtin").find_files() end,
    --   desc = "Find files",
    -- },
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
    ["<leader>fp"] = { ":Telescope smart_open<CR>" },
    ["<leader><leader>"] = { ":Telescope smart_open<CR>" },
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
