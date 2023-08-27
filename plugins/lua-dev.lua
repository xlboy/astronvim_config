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
}
