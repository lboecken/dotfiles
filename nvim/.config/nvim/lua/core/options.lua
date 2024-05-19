vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
-- determine how to display cursor. Can be updated to be different
-- depending on mode
vim.opt.guicursor = ''
-- Enable mouse support for Normal, Insert, Visual and Cmd-Line Mode
vim.opt.mouse = 'a'
-- Enable numbers & relative numbers.
vim.opt.number = true
vim.opt.relativenumber = true
-- Don't show the mode
vim.opt.showmode = false

-- Reasonable tab settings & indent settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.breakindent = true
vim.opt.smartindent = true

-- Ignore case when searching.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Reduce time for which-key & mapped sequences
vim.opt.timeoutlen = 500

-- fix splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Show tabs, spaces when used in background
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live as you type
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true

-- better search options.
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append '@-@'

vim.opt.updatetime = 50
vim.opt.conceallevel = 1
vim.opt.colorcolumn = '80'

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
