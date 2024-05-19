local Job = require 'plenary.job'

-- Check if the path contains "snap"
-- Check if file name contains test_
-- Create keybind for class & function test
-- Check Treesitter if we are in a test class
-- Check Treesitter if we are in a test function

vim.api.nvim_create_augroup('snap-testing-keybinding', { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  desc = 'Register keybinds for running tests in snap',
  group = 'snap-testing-keybinding',
  pattern = { vim.fn.expand '~' .. '/MyEducator/snap/*' .. 'test_*.py' },
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
    end, { desc = '[T]est [F]ile' })
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
    end, { desc = '[T]est [M]ethod' })
  end,
})

vim.api.nvim_create_autocmd({ 'BufLeave' }, {
  desc = 'Deregister keybinds for running tests in snap',
  group = 'snap-testing-keybinding',
  pattern = { vim.fn.expand '~' .. '/MyEducator/snap/*' .. 'test_*.py' },
  callback = function()
    vim.keymap.del({ 'n', 'v' }, '<leader>tf')
  end,
})

-- local get_tmux_pane_ids = function()
--   local job_opts = {
--     command = 'tmux',
--     args = { 'list-panes', '-F', '#D #{pane_at_left}#{pane_at_bottom}#{pane_at_right}#{pane_at_top}' },
--   }
--   local job = Job:new(job_opts):sync()
--   return job
-- end
--
-- local get_tmux_pane_display = function(pane_id)
--   local job_opts = {
--     command = 'tmux',
--     args = { 'capture-pane', '-p', '-t', pane_id },
--   }
--   local job = Job:new(job_opts):sync()
--   return job
-- end
--
-- local pickers = require 'telescope.pickers'
-- local finders = require 'telescope.finders'
-- local previewers = require 'telescope.previewers'
-- local conf = require('telescope.config').values
--
-- local panes = function(opts)
--   opts = opts or {}
--   pickers
--     .new(opts, {
--       prompt_title = 'tmux panes in current window',
--       finder = finders.new_dynamic {
--         fn = get_tmux_pane_ids,
--         entry_maker = function(entry)
--           local pane_id = string.match(entry, '^(%%%d+)')
--           local loc = string.match(entry, '(%d+)$')
--           local location_lookup = {
--             ['1100'] = 'Bottom-Left',
--             ['0110'] = 'Bottom-Right',
--             ['1001'] = 'Top-Left',
--             ['0011'] = 'Top-Right',
--           }
--
--           return {
--             value = entry,
--             display = location_lookup[loc],
--             ordinal = location_lookup[loc],
--             pane_id = pane_id,
--           }
--         end,
--       },
--       sorter = conf.generic_sorter(opts),
--       previewer = previewers.new_termopen_previewer {
--         get_command = function(entry, status)
--           return { 'tmux', 'capture-pane', '-peJ', '-t', entry.pane_id }
--         end,
--       },
--     })
--     :find()
-- end
