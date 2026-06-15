-- Snacks.lazygit
return {
  'folke/snacks.nvim',
  --@type snacks.Config
  opt = {
    lazygit = {
      -- your lazygit configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    {
      '<leader>lg',
      function()
        Snacks.lazygit()
      end,
      desc = 'LazyGit',
    },
  },
}
