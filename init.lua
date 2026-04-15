-- Configuration
require 'config'

-- Plugins
require('lazy').setup {
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  spec = {
    -- Look
    require 'lazy.theme.catppuccin',
    require 'lazy.theme.which-key',
    require 'lazy.theme.gitsigns', -- adds gitsigns recommend keymaps
    require 'lazy.theme.todo-comments',
    { 'nvim-tree/nvim-web-devicons', opts = {} },
    require 'lazy.theme.lualine',
    { 'nvim-mini/mini.icons', version = false, opts = {} },

    -- Language Support
    require 'lazy.plugins.lsp',
    require 'lazy.plugins.lint',
    -- require 'lazy.plugins.debug',
    require 'lazy.plugins.treesitter',
    require 'lazy.plugins.autocomplete',

    -- Feel
    { 'windwp/nvim-autopairs', event = 'InsertEnter', opts = {} },
    require 'lazy.plugins.conform',
    require 'lazy.plugins.indent',
    require 'lazy.plugins.vim-tmux-navigator',

    -- Function
    require 'lazy.plugins.snacks',
    require 'lazy.plugins.picker',
    require 'lazy.plugins.lazygit',
    -- { import = 'lazy.plugins' },
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
