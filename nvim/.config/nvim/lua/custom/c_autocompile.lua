-- Compile a C file via keybind
-- Check if current file is a C file.
-- If so register <leader>cc to compile using clang
-- When exiting a C buffer, unregister the keybind

vim.api.nvim_create_augroup('c-compile-keybind', { clear = true })

vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Register <leader>cc to compile the current file using clang',
  group = 'c-compile-keybind',
  pattern = { '*.c', '*.h' },
  callback = function()
    vim.keymap.set({ 'v', 'n' }, '<leader>cc', function()
      vim.notify('Starting compiling: ' .. vim.fn.expand '%:t')
      local fn = vim.fn.expand '%'
      local output_fn = vim.fn.expand '%:p:h' .. '/main'
      vim.fn.system { 'clang', fn, '-o', output_fn }
      vim.notify 'Finished compiling. No guarantee of success =P'
    end, { desc = '[C]ompile current file using clang. Output to "main" ', buffer = 0 })
  end,
})

vim.api.nvim_create_autocmd('BufLeave', {
  desc = 'Deregister <leader>cc to compile the current file using clang',
  group = 'c-compile-keybind',
  pattern = { '*.c', '*.h' },
  callback = function()
    vim.keymap.del({ 'v', 'n' }, '<leader>cc', { buffer = 0 })
  end,
})
