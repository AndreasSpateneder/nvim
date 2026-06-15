return {
  { 'windwp/nvim-autopairs', event = 'InsertEnter', opts = {} },
  {
    'nmac427/guess-indent.nvim',
    config = function()
      require('guess-indent').setup {}
    end,
  },
}
