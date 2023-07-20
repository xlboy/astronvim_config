return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      null_ls.builtins.formatting.stylua,
    }
    return config -- return final config table
  end,
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_)
      local null_ls = require "null-ls"
      local b = null_ls.builtins
      return {
        handlers = {
          prettierd = function()
            null_ls.register(b.formatting.prettierd.with {
              filetypes = { json = false },
              condition = function(u)
                return u.root_has_file "package.json"
                  or u.root_has_file ".prettierrc"
                  or u.root_has_file ".prettierrc.json"
                  or u.root_has_file ".prettierrc.js"
              end,
            })
          end,
          deno_fmt = function()
            null_ls.register(b.formatting.deno_fmt.with {
              condition = function(u)
                return u.root_has_file "deno.json" or u.root_has_file "deno.jsonc" or u.root_has_file "denonvim.tag"
              end,
            })
          end,
        },
      }
    end,
  },
}
