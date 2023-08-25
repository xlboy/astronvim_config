return {
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("smart_open")
    end,
    dependencies = {
      "kkharji/sqlite.lua",
      "nvim-telescope/telescope.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },
  {
    "xlboy/project.nvim",
    -- dir = "~/Desktop/xlboy/__open-source__/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup({
        manual_mode = true,
        ignore_lsp = { "lua_ls" },
        patterns = { ".git", "Makefile", "pnpm-workspace.yaml", "yarn.lock", "pnpm-lock.yaml" },
      })
      require("telescope").load_extension("projects")
    end,
  },
  {
    "rmagatti/auto-session",
    event = "VeryLazy",
    config = function()
      vim.o.sessionoptions = "buffers"
      require("auto-session").setup({
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      })
      vim.api.nvim_create_autocmd("DirChanged", {
        callback = function()
          vim.loop.new_timer():start(
            50,
            0,
            vim.schedule_wrap(function()
              vim.cmd("SessionRestore")
            end)
          )
        end,
        pattern = "global",
      })
    end,
  },
}
