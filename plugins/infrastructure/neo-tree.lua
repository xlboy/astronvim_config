return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.sources = {
      "filesystem",
    }
    opts.source_selector = {
      -- winbar = false,
      sources = {
        { source = "filesystem" },
      },
    }

    opts.commands["reveal_in_finder"] = function(state)
      local node = state.tree:get_node()
      if node then
        vim.fn.execute("!open -R " .. node.path)
      end
    end
    opts.window.mappings["<C-r>"] = "reveal_in_finder"

    return opts
  end,
}
