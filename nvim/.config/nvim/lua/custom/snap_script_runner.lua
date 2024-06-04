local status, Job = pcall(require, 'plenary.Job')
if status == true then
  vim.api.nvim_create_augroup('snap-scripts-keybinding', { clear = true })

  vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
    desc = 'Register keybinds for running scripts in snap',
    group = 'snap-scripts-keybinding',
    pattern = { vim.fn.expand '~' .. '/MyEducator/snap/scripts/' .. '*.py' },
    callback = function()
      vim.keymap.set({ 'n', 'v' }, '<leader>ts', function()
        local file_path = vim.fn.expand '%:.'
        local list_panes_opts = {
          command = 'tmux',
          args = { 'list-panes', '-F', '#D', '-f', '#{m:zsh,#{pane_current_command}}' },
        }
        local job = Job:new(list_panes_opts):sync()
        local send_keys_opts = {
          command = 'tmux',
          args = { 'send-keys', '-t', job[1], './dev exec snap python3  ' .. '"' .. file_path .. '"', 'Enter' },
        }
        Job:new(send_keys_opts):sync()
      end, { desc = '[T]est [S]cript', buffer = true })
    end,
  })

  --   vim.api.nvim_create_autocmd({ 'BufLeave' }, {
  --     desc = 'Deregister keybinds for running scripts in snap',
  --     group = 'snap-scripts-keybinding',
  --     pattern = { vim.fn.expand '~' .. '/MyEducator/snap/scripts/' .. '*.py' },
  --     callback = function()
  --       vim.keymap.del({ 'n', 'v' }, '<leader>ts', { buffer = true })
  --     end,
  --   })
end
