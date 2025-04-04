-- Open new terminal
-- send cmd to that terminal.
-- Setup  some better keybindings for terminal mode
vim.api.nvim_create_augroup('snap-testing-keybinding', { clear = true })

local send_to_scratch_buf = function(test_path)
  local buf = vim.api.nvim_create_buf(true, true)
  vim.cmd 'vsplit'
  vim.api.nvim_set_current_buf(buf)
  local channel_id = vim.fn.termopen { vim.o.shell, '-i' }
  if channel_id ~= 0 then
    vim.fn.chansend(channel_id, {
      './dev manage test ' .. test_path,
      '<CR>',
    })
  end
end

local parse_node_text = function(target_node_type)
  local result = ''

  local node = vim.treesitter.get_node()
  if not node then
    return ''
  end

  while result == '' do
    if node:type() == target_node_type then
      local name = node:named_child(0)
      if not name then
        return ''
      end
      result = vim.treesitter.get_node_text(name, 0)
    end
    if node == node:parent() then
      return ''
    end
    node = node:parent()
  end
  return result
end

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  desc = 'Register keybinds for running tests in snap',
  group = 'snap-testing-keybinding',
  pattern = { '*/myeducator/*test_*.py' },
  callback = function()
    vim.keymap.set({ 'n', 'v' }, '<leader>tf', function()
      local file_path = vim.fn.expand('%:.:r'):gsub('/', '.')
      vim.fn.setreg('+', file_path)
      send_to_scratch_buf(file_path)
    end, { desc = '[T]est [F]ile', buffer = true })
    vim.keymap.set({ 'n', 'v' }, '<leader>tm', function()
      local func_name = ''
      local class_name = ''

      func_name = parse_node_text 'function_definition'
      if not func_name then
        vim.notify 'Unable to parse out func name'
        return
      end

      class_name = parse_node_text 'class_definition'
      if not class_name then
        vim.notify 'Unable to parse out class name'
        return
      end

      if not func_name:match 'test' and not class_name:match 'test' then
        vim.notify "class || func name does not contain 'test'"
        return ''
      end

      local file_path = vim.fn.expand('%:.:r'):gsub('/', '.')
      local test_path = file_path .. '.' .. class_name .. '.' .. func_name
      send_to_scratch_buf(test_path)
      vim.fn.setreg('+', test_path)
    end, { desc = '[T]est [M]ethod', buffer = true })

    vim.keymap.set({ 'n', 'v' }, '<leader>tc', function()
      local class_name = ''

      class_name = parse_node_text 'class_definition'
      if not class_name then
        vim.notify 'Unable to parse out class name'
        return
      end

      if not class_name:match 'test' then
        vim.notify "class name does not contain 'test'"
        return ''
      end

      local file_path = vim.fn.expand('%:.:r'):gsub('/', '.')
      local test_path = file_path .. '.' .. class_name
      vim.fn.setreg('+', test_path)
      send_to_scratch_buf(test_path)
    end, { desc = '[T]est [C]lass', buffer = true })
  end,
})
