local WINDOWS_COLORS = {
  { "#9e36ff", "#dff9fb" },
  { "#17c0eb", "#dff9fb" },
}

return {}

-- return {
--   "rebelot/heirline.nvim",
--   opts = function(_, opts)
--     local status = require("astronvim.utils.status")
--     local hl = require("astronvim.utils.status.hl")

--     opts.winbar = nil

--     opts.tabline = { -- tabline
--       { -- file tree padding
--         condition = function(self)
--           self.winid = vim.api.nvim_tabpage_list_wins(0)[1]
--           return status.condition.buffer_matches(
--             { filetype = { "aerial", "dapui_.", "neo%-tree", "NvimTree" } },
--             vim.api.nvim_win_get_buf(self.winid)
--           )
--         end,
--         provider = function(self)
--           return string.rep(" ", vim.api.nvim_win_get_width(self.winid) + 1)
--         end,
--         hl = { bg = "tabline_bg" },
--       },
--       status.heirline.make_buflist(status.component.tabline_file_info({
--         hl = function(self)
--           local current_window_index = nil
--           for w_index, w_value in ipairs(vim.api.nvim_list_wins()) do
--             local w_buf = vim.api.nvim_win_get_buf(w_value)
--             if w_buf == self.bufnr then
--               current_window_index = w_index
--               break
--             end
--           end

--           self.winid = vim.api.nvim_tabpage_list_wins(0)[1]
--           local not_normal_win = status.condition.buffer_matches(
--             { filetype = { "aerial", "dapui_.", "neo%-tree", "NvimTree" } },
--             vim.api.nvim_win_get_buf(self.winid)
--           )
--           if not_normal_win and current_window_index ~= nil then
--             current_window_index = current_window_index - 1
--           end

--           local bg = current_window_index ~= nil and WINDOWS_COLORS[current_window_index][1]
--             or hl.get_attributes("buffer_visible", true).bg
--           local fg = current_window_index ~= nil and WINDOWS_COLORS[current_window_index][2] or "#b1d5c8"

--           return { bg = bg, fg = fg }
--         end,
--       })), -- component for each buffer tab
--       status.component.fill({ hl = { bg = "tabline_bg" } }), -- fill the rest of the tabline with background color
--     }
--     return opts
--   end,
-- }
