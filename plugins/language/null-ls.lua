return {
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      handlers = {
        prettier = function()
          require("null-ls").register(require("null-ls").builtins.formatting.prettier.with({
            condition = function(u)
              return u.root_has_file("package.json")
                or u.root_has_file(".prettierrc")
                or u.root_has_file(".prettierrc.json")
                or u.root_has_file(".prettierrc.js")
            end,
          }))
        end,
        eslint_d = function()
          require("null-ls").register(require("null-ls").builtins.diagnostics.eslint_d.with({
            condition = function(u)
              return u.root_has_file(".eslintrc")
                or u.root_has_file(".eslintrc.json")
                or u.root_has_file(".eslintrc.js")
                or u.root_has_file(".eslintrc.cjs")
                or u.root_has_file(".eslintrc.yaml")
                or u.root_has_file(".eslintrc.yml")
            end,
          }))
        end,
      },
    },
  },
}
