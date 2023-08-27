return {
  {
    "TobinPalmer/rayso.nvim",
    cmd = "Rayso",
    config = function()
      require("rayso").setup({
        open_cmd = "Arc",
        options = {
          theme = "breeze",
          padding = 16,
        },
      })
    end,
  },
  {
    "elijahmanor/export-to-vscode.nvim",
    event = "BufReadPost",
    config = function()
      vim.keymap.set("n", "<leader>vsc", require("export-to-vscode").launch, {})
    end,
  },
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    init = function()
      vim.g.VM_mouse_mappings = 1
    end,
  },
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
  },
  {
    "folke/todo-comments.nvim",
    opts = {},
    event = "VeryLazy",
  },
  {
    "tomasky/bookmarks.nvim",
    -- after = "telescope.nvim",
    event = "VeryLazy",
    enabled = false,
    config = function()
      vim.opt.signcolumn = "yes:2"
      require("bookmarks").setup({
        save_file = vim.fn.expand("$HOME/.local/share/nvim/bookmarks"), -- bookmarks save file path
        keywords = {
          ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
          ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
          ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
          ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
        },
        on_attach = function(bufnr)
          local bm = require("bookmarks")
          local map = vim.keymap.set
          map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
          map("n", "mi", bm.bookmark_ann) -- add or edit mark annotation at current line
          map("n", "mc", bm.bookmark_clean) -- clean all marks in local buffer
          map("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
          map("n", "mp", bm.bookmark_prev) -- jump to previous mark in local buffer
          map("n", "ml", bm.bookmark_list) -- show marked file list in quickfix window
        end,
      })
    end,
  },
}
