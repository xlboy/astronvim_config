vim.opt.backup = false

function backup_current_file()
    local current_file = vim.api.nvim_buf_get_name(0)
    local current_cwd = vim.fn.getcwd()
    local relative_path = vim.fn.fnamemodify(current_file, ':~:.' .. current_cwd .. ':.')
    local backup_target_path = current_cwd .. '/.nvim-history/' .. relative_path .. '-' .. vim.fn.strftime('%m-%d %H:%M:%S')
    local backup_target_dir = string.match(backup_target_path, "(.-)[^\\/]+$")
    vim.fn.system('mkdir -p "' .. backup_target_dir .. '"')
    vim.fn.system('cp "' .. current_file .. '" "' .. backup_target_path .. '"')
end

vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('timestamp_backupext', { clear = true }),
  desc = '文件保存前将文件的前一份记录复制到备份目录下',
  pattern = '*',
  callback = backup_current_file
});

if vim.g.neovide then
  local alpha = function() return string.format("%x", math.floor(255 * vim.g.transparency or 0.8)) end

  vim.g.neovide_padding_right = 5
  vim.g.neovide_padding_left = 5
  vim.o.guifont = "ComicShannsMono Nerd Font Mono:h14"
  vim.g.neovide_transparency = 0.0
  vim.g.transparency = 0.8
  vim.g.neovide_background_color = "#0f1117" .. alpha()
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_input_use_logo = 1
  vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
  vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
  vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
  vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})
end

return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "tokyonight",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = false,
    underline = true,
  },

  lsp = {
    mappings = {
      n = {
        -- this mapping will only be set in buffers with an LSP attached
        gh = { function() vim.lsp.buf.hover() end, desc = "Hover symbol details" },
        K = false,
      },
    },
    formatting = {
      -- control auto formatting on save
      format_on_save = false,
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
      },
      timeout_ms = 1000, -- default format timeout
    },
    config = {
      emmet_ls = function(opts)
        opts.filetypes = { "html", "css", "javascript", "jsx", "typescript", "tsx" }
        opts.settings = {
          css_filetypes = { "css", "javascript", "jsx", "typescript", "tsx" },
        }
        return opts
      end,
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
