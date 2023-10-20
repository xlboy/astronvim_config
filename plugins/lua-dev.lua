return {
  { "folke/neodev.nvim" },
  {
    "rafcamlet/nvim-luapad",
    event = "VeryLazy",
    config = function()
      require("luapad").setup({
        eval_on_change = false,
        wipe = false,
      })
    end,
  },
  {
    "LintaoAmons/scratch.nvim",
    event = "VimEnter",
    keys = {
      { "<leader>scce", "<cmd>ScratchEditConfig<cr>", desc = "sc - config edit" },
      { "<leader>scci", "<cmd>ScratchInitConfig<cr>", desc = "sc - config init" },
      { "<leader>scn", "<cmd>Scratch<cr>", desc = "sc - new scratch" },
      { "<leader>scN", "<cmd>ScratchWithName<cr>", desc = "sc - new scratch (named)" },
      { "<leader>sco", "<cmd>ScratchOpen<cr>", desc = "sc - open scratch" },
      { "<leader>scO", "<cmd>ScratchOpenFzf<cr>", desc = "sc - open scratch (fzf)" },
    },
  },
  {
    -- 先装 rust，再去到对应的目录下 install
    "michaelb/sniprun",
    config = function()
      require("sniprun").setup({
        display = { "Terminal" },
      })
    end,
    keys = {
      {
        "<leader>ra",
        function()
          require("sniprun.api").run_range(1, vim.fn.line("$"))
        end,
        desc = "All",
      },
      {
        "<leader>rr",
        function()
          require("sniprun").run()
        end,
        desc = "Current",
      },
      {
        "<leader>rr",
        function()
          require("sniprun").run("v")
        end,
        mode = { "v" },
        desc = "Selection",
      },
      {
        "<leader>rR",
        function()
          require("sniprun").clear_repl()
          require("sniprun.display").close_all()
          require("sniprun").reset()
        end,
        desc = "Reset & (Close UI, Clear REPL)",
      },
    },
  },
}
