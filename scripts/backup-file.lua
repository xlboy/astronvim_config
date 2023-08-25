vim.opt.backup = false

local backup_current_file = function()
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_cwd = vim.fn.getcwd()
  local relative_path = vim.fn.fnamemodify(current_file, ":~:." .. current_cwd .. ":.")
  local backup_target_path = current_cwd
    .. "/.nvim-history/"
    .. relative_path
    .. "-"
    .. vim.fn.strftime("%m-%d %H:%M:%S")
  local backup_target_dir = string.match(backup_target_path, "(.-)[^\\/]+$")
  vim.fn.system('mkdir -p "' .. backup_target_dir .. '"')
  vim.fn.system('cp "' .. current_file .. '" "' .. backup_target_path .. '"')
end

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("timestamp_backupext", { clear = true }),
  desc = "文件保存前将文件的前一份记录复制到备份目录下",
  pattern = "*",
  callback = backup_current_file,
})
