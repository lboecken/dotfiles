return {
  'folke/zen-mode.nvim',
  config = function()
    local zen_mode = require 'zen-mode'
    zen_mode.setup {
      window = { width = 0.6 },
      on_open = function(win)
        vim.o.wrap = true
        vim.o.linebreak = true
      end,
      on_close = function(win)
        vim.o.wrap = false
        vim.o.linebreak = false
      end,
    }
    vim.keymap.set('n', '<leader>z', function()
      zen_mode.toggle {}
    end, {
      desc = 'Toggle [z]en mode desktop',
    })
    vim.keymap.set('n', '<leader>Z', function()
      zen_mode.toggle { window = { width = 0.8 } }
    end, {
      desc = 'Toggle [Z]en mode laptop',
    })
  end,
}
