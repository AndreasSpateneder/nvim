return {
  'catppuccin/nvim',
  name = 'catppuccin',
  laty = false,
  priority = 1000,
  opts = {
    flavour = 'mocha', -- latte, frappe, macchiato, mocha
    background = { -- :h background
      light = 'latte',
      dark = 'mocha',
    },
    transparent_background = true,
    float = { transparent = true, solid = false },
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
      enabled = false, -- dims the background color of inactive window
      shade = 'dark',
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    default_integrations = true,
    auto_integrations = true,
    integrations = {
      cmp = true,
      gitsigns = true,
      mason = true,
      snacks = true,
      which_key = true,
    },
  },
  config = function(_, opts)
    require('catppuccin').setup(opts)
    vim.cmd.colorscheme 'catppuccin-nvim'
  end,
}
