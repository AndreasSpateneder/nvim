-- Diagnostic Config & Keymaps
-- See :help vim.diagnostic.Opts
local map = vim.keymap.set

vim.api.nvim_set_hl(0, 'DiagnosticErrorLine', { bg = '#51202A', blend = 20 })
vim.api.nvim_set_hl(0, 'DiagnosticWarnLine', { bg = '#3B3B1B', blend = 15 })
vim.api.nvim_set_hl(0, 'DiagnosticInfoLine', { bg = '#1F3342', blend = 10 })
vim.api.nvim_set_hl(0, 'DiagnosticHintLine', { bg = '#1E2E1E', blend = 10 })
vim.api.nvim_set_hl(0, 'DapBreakpointSign', { fg = '#FF0000', bold = true })

-- DAP signs are still defined with sign_define()
vim.fn.sign_define('DapBreakpoint', {
  text = '●', -- a large dot; change as desired
  texthl = 'DapBreakpointSign', -- the highlight group you just defined
  linehl = '', -- no full-line highlight
  numhl = '', -- no number-column highlight
})

local function show_diagnostic_on_jump(diagnostic, bufnr)
  if not diagnostic then
    return
  end

  vim.diagnostic.open_float {
    bufnr = bufnr,
    scope = 'cursor',
    border = 'rounded',
    source = true,
    focusable = false,
    close_events = { 'CursorMoved', 'CursorMovedI', 'BufHidden', 'InsertCharPre', 'WinLeave' },
  }
end

vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = 'DiagnosticErrorLine',
      [vim.diagnostic.severity.WARN] = 'DiagnosticWarnLine',
      [vim.diagnostic.severity.INFO] = 'DiagnosticInfoLine',
      [vim.diagnostic.severity.HINT] = 'DiagnosticHintLine',
    },
  } or {},

  -- Can switch between these as you prefer
  virtual_lines = false,
  virtual_text = {
    spacing = 2,
    source = 'if_many',
    prefix = '●',
  },

  jump = {
    on_jump = show_diagnostic_on_jump,
  },
}

vim.keymap.set('n', '<leader>q', function()
  if vim.fn.getloclist(0, { winid = 1 }).winid ~= 0 then
    vim.cmd.lclose()
  else
    vim.diagnostic.setloclist { open = true }
  end
end, { desc = 'Toggle diagnostic [q]uickfix list' })

vim.keymap.set('n', '<leader>Q', function()
  if vim.fn.getqflist({ winid = 1 }).winid ~= 0 then
    vim.cmd.cclose()
  else
    vim.diagnostic.setqflist { open = true }
  end
end, { desc = 'Global diagnostic [Q]uickfix list' })

-- -- diagnostic keymaps
-- local diagnostic_goto = function(next, severity)
--   severity = severity and vim.diagnostic.severity[severity] or nil
--   return function()
--     vim.diagnostic.jump { count = next and 1 or -1, float = true, severity = severity }
--   end
-- end
--
-- map('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
-- map('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
-- map('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
-- map('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
-- map('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
-- map('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
-- map('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })
