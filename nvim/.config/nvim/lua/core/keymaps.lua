-- File Explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Movement of lines while highlighting
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Move below line to end of current
vim.keymap.set('n', 'J', 'mzJ`z')

-- Half page movement while remain in middle
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- search terms remain in middle
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- save files
vim.keymap.set({ 'n', 'v' }, '<leader>fs', ':w<CR>', { desc = '[S]ave [F]ile' })
vim.keymap.set({ 'n', 'v' }, '<leader>fS', ':wall<CR>', { desc = '[S]ave all [F]iles' })

-- paste over word w/o losing original paste
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = '[P]aste w/o losing original paste' })

-- yank to sys clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = '[Y]ank selection to sys clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = '[Y]ank till end of line to sys clipboard' })

-- delete w/o losing original paste
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = '[D]elete without losing paste' })

-- This is going to get me cancelled
vim.keymap.set('i', '<C-c>', '<Esc>')

-- kill Q
vim.keymap.set('n', 'Q', '<nop>')

-- Format
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

-- vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make current file executable via chmod' })

-- Source file
vim.keymap.set('n', '<leader><leader>', function()
  vim.cmd 'so %'
end, { desc = 'Resource current file' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>js', ':!work myed<CR><CR>', { desc = 'Jump to snap' })
vim.keymap.set('n', '<leader>jd', ':!work dserv<CR><CR>', { desc = 'Jump to dserv' })
vim.keymap.set('n', '<leader>jl', ':!work vlib<CR><CR>', { desc = 'Jump to vlib' })
vim.keymap.set('n', '<leader>jc', ':!tmux_sessionizer dotf <CR><CR>', { desc = 'Jump to dotfiles' })
