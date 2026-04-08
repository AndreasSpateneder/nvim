-- [[ Setting options ]]
-- See `:help opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

local opt = vim.opt

opt.number = true -- Line numbers
opt.relativenumber = true -- Relative line numbers
opt.cursorline = true -- Highlight current line
opt.wrap = true -- Wrap lines
opt.breakindent = true
opt.scrolloff = 10 -- Keep 10 lines above/below cursor
opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor

-- Indentation
opt.tabstop = 2 -- Tab width
opt.shiftwidth = 2 -- Indent width
opt.softtabstop = 2 -- Soft tab stop
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Smart auto-indenting
opt.autoindent = true -- Copy indent from current line

-- Search settings
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true -- Case insensitive search
opt.smartcase = true -- Case sensitive if uppercase in search
opt.hlsearch = true -- Highlight search results
opt.incsearch = true -- Show matches as you type

-- Visual settings
opt.signcolumn = 'yes' -- Always show sign column
opt.showmatch = true -- Highlight matching brackets
opt.matchtime = 5 -- How long to show matching bracket
opt.showmode = false -- Don't show mode in command line
opt.completeopt = 'menu,menuone,noselect'
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.virtualedit = 'block' -- Allow cursor to move where there is no text in visual block mode
opt.winminwidth = 5 -- Minimum window width

-- File handling
opt.backup = false -- Don't create backup files
opt.writebackup = false -- Don't create backup before writing
opt.swapfile = false -- Don't create swap files
opt.undofile = true -- Persistent undo
opt.undolevels = 10000
opt.undodir = vim.fn.expand '~/.vim/undodir' -- Undo directory
opt.updatetime = 250 -- Faster completion
opt.maxmempattern = 20000
opt.timeoutlen = 300 -- Lower than default (1000) to quickly trigger which-key
-- opt.ttimeoutlen = 0 -- Key code timeout
opt.autoread = true -- Auto reload files changed outside vim
-- opt.autowrite = true -- Auto save

-- Behavior settings
opt.hidden = true -- Allow hidden buffers
opt.backspace = 'indent,eol,start' -- Better backspace behavior
opt.iskeyword:append '-' -- Treat dash as part of word
opt.path:append '**' -- include subdirectories in search
opt.selection = 'exclusive' -- Selection behavior
opt.mouse = 'a' -- Enable mouse support
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)

-- Folding settings
opt.smoothscroll = true
vim.wo.foldmethod = 'expr'
opt.foldlevel = 99 -- Start with all folds open
opt.formatoptions = 'jcroqlnt' -- tcqj

-- Split behavior
opt.splitbelow = true -- Horizontal splits go below
opt.splitright = true -- Vertical splits go right
opt.inccommand = 'split' -- Preview substitutions live, as you type!

-- Better diff options
opt.diffopt:append 'linematch:60'

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand '~/.vim/undodir'
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, 'p')
end

vim.g.autoformat = true
vim.g.trouble_lualine = true

-- Enable break indent
opt.fillchars = {
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}

opt.jumpoptions = 'view'
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- Wrap lines at convenient points
opt.list = true -- Show some invisible characters (tabs...
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.shiftround = true -- Round indent
opt.shortmess:append { W = false, I = true, c = true, C = true }

vim.g.markdown_recommended_style = 0

vim.filetype.add {
  extension = {
    env = 'dotenv',
  },
  filename = {
    ['.env'] = 'dotenv',
    ['env'] = 'dotenv',
  },
  pattern = {
    ['[jt]sconfig.*.json'] = 'jsonc',
    ['%.env%.[%w_.-]+'] = 'dotenv',
  },
}
