return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      transparent_background = true,
      float = { transparent = true, solid = false },
      auto_integrations = false,
      integrations = {
        blink_cmp = {
          enabled = true,
          style = 'bordered',
        },
        gitsigns = true,
        mason = true,
        snacks = true,
        which_key = true,
      },
    }
    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
}
