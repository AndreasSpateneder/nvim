return { -- Highlight todo, notes, etc in comments
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {},
  opts = {
    signs = true, -- show icons in the signs column
  },
  config = function(_, opts)
    require('todo-comments').setup(opts)

    vim.keymap.set('n', '<leader>jt', function()
      require('todo-comments').jump_next()
    end, { desc = 'Next todo comment' })

    vim.keymap.set('n', '<leader>kt', function()
      require('todo-comments').jump_prev()
    end, { desc = 'Previous todo comment' })
  end,
}
