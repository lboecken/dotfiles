return {
  'folke/zen-mode.nvim',
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    local zen_mode = require 'zen-mode'
    vim.keymap.set('n', '<leader>z', function()
      zen_mode.toggle { window = { width = 0.75 } }
    end, { desc = 'Toggle [Z]en mode' })
  end,
}
