-- custom inverses
return {
  'nguyenvukhang/nvim-toggler',
  config = function()
    require('nvim-toggler').setup {

      inverses = {
        ['True'] = 'False',
        ['true'] = 'false',
        ['Yes'] = 'No',
        ['yes'] = 'no',
        ['=='] = '!=',
        ['if'] = 'if not',
        ['TODO:'] = 'DONE:',
      },
      -- removes the default <leader>i keymap
      remove_default_keybinds = true,
      -- removes the default set of inverses
      -- remove_default_inverses = true,
      -- custom keybinding if wanted
      vim.keymap.set({ 'n', 'v' }, '<leader>ei', require('nvim-toggler').toggle, { desc = '[E]dit conditionals by [I]nverting' }),
    }
  end,
}
