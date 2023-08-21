return {
  { "folke/neodev.nvim" },
  {
    "rafcamlet/nvim-luapad",
    event = "VeryLazy",
    config = function()
      require("luapad").setup({
        wipe = false,
      })
    end,
  },
}
