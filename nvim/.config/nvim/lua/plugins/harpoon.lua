return {
  'theprimeagen/harpoon',
  config = function()
    require 'harpoon'
    local _, mark = pcall(require, 'harpoon.mark')
    local _, ui = pcall(require, 'harpoon.ui')
    vim.keymap.set('n', '<leader>ha', mark.add_file, { desc = '[H]arpoon [A]dd' })
    vim.keymap.set('n', '<leader>hh', ui.toggle_quick_menu, { desc = '[H]arpoon [M]enu' })

    vim.keymap.set('n', '<leader>h1', function()
      ui.nav_file(1)
    end, { desc = 'Open [H]arpoon File 1' })
    vim.keymap.set('n', '<leader>h2', function()
      ui.nav_file(2)
    end, { desc = 'Open [H]arpoon File 2' })
    vim.keymap.set('n', '<leader>h3', function()
      ui.nav_file(3)
    end, { desc = 'Open [H]arpoon File 3' })
    vim.keymap.set('n', '<leader>h4', function()
      ui.nav_file(4)
    end, { desc = 'Open [H]arpoon File 4' })
  end,
}
