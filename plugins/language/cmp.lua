return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
  },
  event = "InsertEnter",
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      enabled = false,
      completion = {
        autocomplete = false,
      },
    })
  end,
}
