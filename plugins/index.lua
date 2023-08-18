return {
  require("plugins/astro/community"),
  require("plugins/astro/default"),

  require("plugins/language/mason"),
  require("plugins/language/null-ls"),
  require("plugins/language/treesitter"),
  require("plugins/language/lsp-helpers"),

  require("plugins/ui"),
  require("plugins/motion"),
}
