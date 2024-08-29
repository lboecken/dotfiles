local status, Job = pcall(require, 'plenary.Job')
if status == true then
  -- Check if the path contains "snap"
  -- Check if file name contains test_
  -- Create keybind for class & function test
  -- Check Treesitter if we are in a test class
  -- Check Treesitter if we are in a test function

  vim.api.nvim_create_augroup('snap-testing-keybinding', { clear = true })

  vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
    desc = 'Register keybinds for running tests in snap',
    group = 'snap-testing-keybinding',
    pattern = { '*/snap/*test_*.py' },
    callback = function()
      vim.keymap.set({ 'n', 'v' }, '<leader>tf', function()
        local file_path = vim.fn.expand('%:.:r'):gsub('/', '.')
        local list_panes_opts = {
          command = 'tmux',
          args = { 'list-panes', '-F', '#D', '-f', '#{m:zsh,#{pane_current_command}}' },
        }
        local job = Job:new(list_panes_opts):sync()
        local send_keys_opts = {
          command = 'tmux',
          args = { 'send-keys', '-t', job[1], './dev manage test ' .. file_path, 'Enter' },
        }
        Job:new(send_keys_opts):sync()
      end, { desc = '[T]est [F]ile', buffer = true })
      vim.keymap.set({ 'n', 'v' }, '<leader>tm', function()
        local func_name = ''
        local class_name = ''

        local node = vim.treesitter.get_node()
        if not node then
          vim.notify '[T]est [M]ethod failed. Start node not located'
          return ''
        end

        while func_name == '' do
          if node:type() == 'function_definition' then
            local name = node:named_child(0)
            if not name then
              vim.notify '[T]est [M]ethod failed. Function name not located'
              return ''
            end
            func_name = vim.treesitter.get_node_text(name, 0)
          end
          if node == node:parent() then
            vim.notify '[T]est [M]ethod failed. Hit top of file'
            return ''
          end
          node = node:parent()
        end

        if not node then
          vim.notify '[T]est [M]ethod failed. Hit nil node after getting function name'
          return ''
        end

        while class_name == '' do
          if node:type() == 'class_definition' then
            local name = node:named_child(0)
            if not name then
              vim.notify '[T]est [M]ethod failed. Class name not located'
              return ''
            end
            class_name = vim.treesitter.get_node_text(name, 0)
          end
          if node == node:parent() then
            vim.notify '[T]est [M]ethod failed. Hit top of file'
            return ''
          end

          node = node:parent()
        end
        if not func_name:match 'test' and not class_name:match 'test' then
          vim.notify "class || func name does not contain 'test'"
          return ''
        end

        local file_path = vim.fn.expand('%:.:r'):gsub('/', '.')
        local test_path = file_path .. '.' .. class_name .. '.' .. func_name
        local list_panes_opts = {
          command = 'tmux',
          args = { 'list-panes', '-F', '#D', '-f', '#{m:zsh,#{pane_current_command}}' },
        }
        local job = Job:new(list_panes_opts):sync()
        local send_keys_opts = {
          command = 'tmux',
          args = { 'send-keys', '-t', job[1], './dev manage test ' .. test_path, 'Enter' },
        }
        Job:new(send_keys_opts):sync()
      end, { desc = '[T]est [M]ethod', buffer = true })
    end,
  })
end
