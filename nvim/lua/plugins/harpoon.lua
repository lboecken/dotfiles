return {
  'theprimeagen/harpoon',
  config = function()
    require 'harpoon'
    local _, mark = pcall(require, 'harpoon.mark')
    local _, ui = pcall(require, 'harpoon.ui')
    vim.keymap.set('n', '<leader>a', mark.add_file, { desc = '[A]dd Current file to Harpoon menu' })
    vim.keymap.set('n', '<leader>h', ui.toggle_quick_menu, { desc = 'Open [H]arpoon menu' })

    vim.keymap.set('n', '<C-h>', function()
      ui.nav_file(1)
    end)
    vim.keymap.set('n', '<C-t>', function()
      ui.nav_file(2)
    end)
    vim.keymap.set('n', '<C-n>', function()
      ui.nav_file(3)
    end)
    vim.keymap.set('n', '<C-s>', function()
      ui.nav_file(4)
    end)
  end,
}
