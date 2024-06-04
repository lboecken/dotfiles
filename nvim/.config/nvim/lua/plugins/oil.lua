return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {

      columns = { 'icon' },
      keymaps = {
        ['<C-l>'] = false,
        ['<D-l>'] = 'actions.refresh',
        ['<C-h>'] = false,
        ['<D-h>'] = 'actions.select_split',
      },
      view_options = {
        show_hidden = true,
      },
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' }),
      vim.keymap.set('n', '<leader>-', require('oil').toggle_float, { desc = 'Open parent directory in floating window' }),
    }
  end,
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
