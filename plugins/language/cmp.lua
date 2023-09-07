return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
  },
  event = "InsertEnter",
  opts = function()
    local cmp = require("cmp")
    local snip_status_ok, luasnip = pcall(require, "luasnip")
    local lspkind_status_ok, lspkind = pcall(require, "lspkind")
    local utils = require("astronvim.utils")
    if not snip_status_ok then
      return
    end
    local border_opts = {
      border = "rounded",
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
    }

    return {
      enabled = function()
        local dap_prompt = utils.is_available("cmp-dap") -- add interoperability with cmp-dap
          and vim.tbl_contains(
            { "dap-repl", "dapui_watches", "dapui_hover" },
            vim.api.nvim_get_option_value("filetype", { buf = 0 })
          )
        if vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt" and not dap_prompt then
          return false
        end
        return vim.g.cmp_enabled
      end,
      preselect = cmp.PreselectMode.None,
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind_status_ok and lspkind.cmp_format(utils.plugin_opts("lspkind.nvim")) or nil,
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      duplicates = {
        nvim_lsp = 1,
        luasnip = 1,
        cmp_tabnine = 1,
        buffer = 1,
        path = 1,
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      window = {
        completion = cmp.config.window.bordered(border_opts),
        documentation = cmp.config.window.bordered(border_opts),
      },
      mapping = {
        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          fallback()
        end, { "i", "s" }),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      }),
    }
  end,
}
