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

-- More sane window resizing
vim.keymap.set('n', '<C-w>+', '<C-w>10+', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-w>-', '<C-w>10-', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-w>>', '<C-w>10>', { desc = 'Increase window width' })
vim.keymap.set('n', '<C-w><', '<C-w>10<', { desc = 'Decrease window width' })

-- Terminal updates
-- Make <C-h>, <C-j>, <C-k>, <C-l> work for navigating between windows
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('t', '<C-h>', [[<C-\><C-n><C-w>h]], opts)
vim.api.nvim_set_keymap('t', '<C-j>', [[<C-\><C-n><C-w>j]], opts)
vim.api.nvim_set_keymap('t', '<C-k>', [[<C-\><C-n><C-w>k]], opts)
vim.api.nvim_set_keymap('t', '<C-l>', [[<C-\><C-n><C-w>l]], opts)

vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], opts)

-- Open a new terminal in a split
vim.api.nvim_set_keymap('n', '<leader>tt', ':split | terminal<CR>', opts) -- Horizontal
vim.api.nvim_set_keymap('n', '<leader>tv', ':vsplit | terminal<CR>', opts) -- Vertical

-- Toggle terminal mode easily with <C-\>
vim.api.nvim_set_keymap('t', '<C-\\>', [[<C-\><C-n>]], opts)

-- Handy maximize function.
local function toggle_maximize_buffer()
  local open = true
  local tab_label = 'MAXIMIZE'

  while true do
    local found_tab = nil
    local tabpages = vim.api.nvim_list_tabpages()

    for _, tp in ipairs(tabpages) do
      local success, var_value = pcall(vim.api.nvim_tabpage_get_var, tp, tab_label)
      if success and var_value == tab_label then
        found_tab = tp
        break
      end
    end

    if found_tab then
      vim.api.nvim_set_current_tabpage(found_tab)
      vim.cmd 'tabclose'
      open = false
      break
    else
      break -- Exit the loop if the tab is not found
    end
  end

  if open then
    vim.cmd 'tabedit %'
    vim.api.nvim_tabpage_set_var(0, tab_label, tab_label)
  end
end

vim.keymap.set('n', '<leader>m', toggle_maximize_buffer, { desc = 'Toggle [M]aximize Buffer in New Tab' })

vim.keymap.set('n', '<leader>m', toggle_maximize_buffer, { desc = 'Toggle [M]aximize Buffer in New Tab' })
