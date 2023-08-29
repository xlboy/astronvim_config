local CAT = {
  FS = "📁 fs",
  EDIT = "✍️  edit",
  BUF = "🖥️ buf",
  WINDOW = "🏋️ window",
  LSP = "💿 lsp",
  GIT = "👫 git",
}

local commands = {
  {
    desc = "Copy current file name",
    cmd = function()
      local file_path = vim.api.nvim_buf_get_name(0)
      local file_name = vim.fn.fnamemodify(file_path, ":t")
      vim.fn.system("echo -n " .. file_name .. " | pbcopy")
    end,
    cat = CAT.FS,
  },
  {
    desc = "Copy current file path (absolute)",
    cmd = function()
      local file_path = vim.api.nvim_buf_get_name(0)
      vim.fn.system("echo -n " .. file_path .. " | pbcopy")
    end,
    cat = CAT.FS,
  },
  {
    desc = "Copy current file path & line (relative to cwd)",
    cmd = function()
      local file_path = vim.api.nvim_buf_get_name(0)
      local relative_path = vim.fn.fnamemodify(file_path, ":~:." .. vim.fn.getcwd() .. ":.")
      local current_line = vim.api.nvim_win_get_cursor(0)[1]
      local file_path_and_line = relative_path .. ":" .. current_line
      vim.fn.system("echo -n " .. file_path_and_line .. " | pbcopy")
    end,
    cat = CAT.FS,
  },
  {
    desc = "Open the current file in finder",
    cmd = function()
      vim.fn.system("open -R " .. vim.api.nvim_buf_get_name(0))
    end,
    cat = CAT.FS,
  },
  {
    desc = "Merge 2 lines",
    cmd = "<CMD>join<CR>",
    cat = CAT.EDIT,
  },
  {
    desc = "Restart lsp server",
    cmd = "<CMD>LspRestart<CR>",
    cat = CAT.LSP,
  },
  {
    desc = "TS twoslash-queries enable",
    cmd = "<CMD>TwoslashQueriesEnable<CR>",
    cat = CAT.LSP,
  },
  {
    desc = "TS twoslash-queries disable",
    cmd = "<CMD>TwoslashQueriesDisable<CR>",
    cat = CAT.LSP,
  },
  {
    desc = "TS twoslash-queries inspect",
    cmd = "<CMD>TwoslashQueriesInspect<CR>",
    cat = CAT.LSP,
  },
  {
    desc = "TS Refresh Highlight",
    cmd = function()
      vim.cmd([[TSDisable highlight]])
      vim.cmd([[TSEnable highlight]])
    end,
    cat = CAT.LSP,
  },
  {
    desc = "Reload Buffer",
    cmd = "<CMD>bufdo e<CR>zz",
    cat = CAT.BUF,
  },
  {
    desc = "Reload Window",
    cmd = "<CMD>windo e<CR>zz",
    cat = CAT.WINDOW,
  },
  {
    desc = "Advanced git search",
    cmd = "<CMD>AdvancedGitSearch<CR>",
    cat = CAT.GIT,
  },
}

return {
  "FeiyouG/commander.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "<leader>pp", "<CMD>Telescope commander<CR>", mode = "n" },
  },
  config = function()
    require("commander").setup({
      components = {
        "CAT",
        "DESC",
      },
      integration = {
        telescope = {
          enable = true,
        },
        lazy = {
          enable = false,
        },
      },
    })

    require("commander").add(commands)
  end,
}
