local jump_to_specified_percent= function(percent)
  local line = vim.api.nvim_get_current_line()
  local trimmed_line = string.gsub(line, "^%s+", "")
  local space_len = string.len(line) - string.len(trimmed_line)
  local target_column = math.floor(#trimmed_line * percent) + space_len
  local current_line = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_win_set_cursor(0, {current_line, target_column})
end

local inline_jump_percent = function()
  local line = vim.api.nvim_get_current_line()
  local trimmed_line = string.gsub(line, "^%s+", "")
  local space_len = string.len(line) - string.len(trimmed_line)
  local percent_column_map = {
    ["25%"] = math.floor(#trimmed_line * 0.25) + space_len,
    ["50%"] = math.floor(#trimmed_line * 0.5) + space_len,
    ["75%"] = math.floor(#trimmed_line * 0.75) + space_len
  }
  local cursor = vim.api.nvim_win_get_cursor(0)
  local current_line = cursor[1]
  local current_column = cursor[2]
  local target_column;
  if (current_column < percent_column_map["25%"]) then
    target_column = percent_column_map["25%"]
  elseif (current_column < percent_column_map["50%"]) then
    target_column = percent_column_map["50%"]
  elseif (current_column >= percent_column_map["75%"]) then
    target_column = percent_column_map["25%"]
  else
    target_column = percent_column_map["75%"]
  end
  vim.api.nvim_win_set_cursor(0, {current_line, target_column})
end

return {
  n = {
    ["ZZ"] = { '' },
    ["'d"] = { '"0d' },
    ["'c"] = { '"0c' },
    ["<S-w>"] = { '3w' },
    ["<S-b>"] = { '3b' },
    ["e"] = { function() inline_jump_percent() end},
    ["g1"] = { function() jump_to_specified_percent(0.25) end },
    ["g2"] = { function() jump_to_specified_percent(0.5) end },
    ["g3"] = { function() jump_to_specified_percent(0.75) end },
    ["<leader>tt"] = { "<cmd>:TodoTelescope<CR>" },
    ["<leader>fml"] = { "<cmd>CellularAutomaton make_it_rain<CR>" },
    ["<leader>fmk"] = { "<cmd>CellularAutomaton game_of_life<CR>" },
    ["<leader>all"] = { "ggVG" },
    ["<leader>/"] = {
      function() require("telescope.builtin").live_grep() end,
      desc = "Find words",
    },
    ["<C-r>"] = {
      function() vim.fn.system('open -R ' .. vim.api.nvim_buf_get_name(0)) end
    },
    ["<leader>,"] = {
      function() require("telescope.builtin").buffers() end,
      desc = "Find buffers",
    },
    ["<leader>fp"] = {
      function()
        require('telescope').extensions.projects.projects {}
      end,
    },
    ["<S-h>"] = { "^" },
    ["<S-l>"] = { "$" },
    ["<S-k>"] = { "8k" },
    ["<S-j>"] = { "8j" },
    ["<S-u>"] = { "20k" },
    ["<S-d>"] = { "20j" },
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
    ["<S-w>"] = { '3w' },
    ["<S-b>"] = { '3b' },
  },
  t = {},
}
