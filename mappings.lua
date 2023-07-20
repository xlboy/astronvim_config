-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    [";"] = { ":", desc = "command mode" },
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
    ["<S-l>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-h>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous tab",
    },
    ["<M-j>"] = { "<cmd> m+ <cr>", desc = "movel line down" },
    ["<M-k>"] = { "<cmd> m-2 <cr>", desc = "movel line up" },
  },
  i = {
    ["<C-h>"] = { "<left>", desc = "left" },
    ["<C-j>"] = { "<down>", desc = "down" },
    ["<C-k>"] = { "<up>", desc = "up" },
    ["<C-l>"] = { "<right>", desc = "right" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
