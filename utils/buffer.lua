local M = {}

---@return integer | nil # 当前 active-buffer 在 buffer-list 的位置
function M.get_current_buf_position()
  local current_buf = vim.api.nvim_get_current_buf()
  local buffers = vim.api.nvim_list_bufs()

  for i, buf in ipairs(buffers) do
    if buf == current_buf then
      return i
    end
  end

  return nil
end

---@return integer | nil #
--- 取下一个 buffer 的位置
--- 例：当前是 3，且不是结尾，那则返回 4；而如果是结尾，则返回 1
--- 如果仅打开了 1 个 buffer，下一个则无效，返回 nil
function M.get_next_buf_position()
  local buffers = vim.api.nvim_list_bufs()
  if #buffers == 1 then
    return nil
  end

  local current_buf_position = M.get_current_buf_position()
  if current_buf_position == #buffers then
    return 1
  end

  return current_buf_position + 1
end

---@return integer | nil #
--- 取上一个 buffer 的位置
--- 例：当前是 3，且不是开头，那则返回 2；而如果是开头，则返回结尾位置
--- 如果仅打开了 1 个 buffer，上一个则无效，返回 nil
function M.get_prev_buf_position()
  local buffers = vim.api.nvim_list_bufs()
  if #buffers == 1 then
    return nil
  end

  local current_buf_position = M.get_current_buf_position()
  if current_buf_position == 1 then
    return #buffers
  end

  return current_buf_position - 1
end

---@param buf integer #要检查的 buffer
---@return boolean # 指定的 buffer 是否已在窗口中打开（打开与激活不同，激活可以看作是焦点）
function M.is_open(buf)
  local windows = vim.api.nvim_list_wins()

  for _, win in ipairs(windows) do
    if vim.api.nvim_win_get_buf(win) == buf then
      return true
    end
  end

  return false
end

return M
