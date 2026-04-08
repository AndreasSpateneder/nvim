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

    -- LSP
    require 'lazy.plugins.lsp',
    require 'lazy.plugins.autocomplete',

    -- Feel
    require 'lazy.plugins.treesitter',
    { 'windwp/nvim-autopairs', event = 'InsertEnter', opts = {} },
    require 'lazy.plugins.lint',
    require 'lazy.plugins.conform',
    require 'lazy.plugins.indent',
    require 'lazy.plugins.lazygit',

    -- Function
    require 'lazy.plugins.vim-tmux-navigator',
    require 'lazy.plugins.picker',
    require 'lazy.plugins.snacks',
    -- require 'lazy.plugins.debug',
    -- { import = 'lazy.plugins' },
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
