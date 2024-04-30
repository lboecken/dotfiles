local function branch_name()
  local branch = vim.fn.system "git branch --show-current 2> /dev/null | tr -d '\n'"
  if branch ~= '' then
    return branch
  else
    return ''
  end
end

return {
  'epwalsh/obsidian.nvim',
  config = function()
    require('obsidian').setup {
      workspaces = {
        {
          name = 'zettelkasten',
          path = '~/zettelkasten',
        },
      },
      templates = {
        subdir = 'templates',
      },
      daily_notes = {
        folder = 'dailies',
        date_format = '%Y-%m-%d',
        template = 'daily',
      },
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        local suffix = ''
        -- 4 Char suffix just in case I accidentally try to create a collision
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
        return tostring(os.date '%Y%m%d-%H%M') .. '-' .. suffix
      end,
    }

    local client = require('obsidian').get_client()
    -- Custom Keybinds
    vim.keymap.set('n', '<leader>on', function()
      local note = client.create_note(client)
      client.open_note(client, note)
    end, { desc = '[O]bsidian [N]ew' })

    vim.keymap.set('n', '<leader>ot', function()
      local note = client.today(client)
      client.open_note(client, note)
    end, { desc = '[O]bsidian [T]oday' })

    vim.keymap.set('n', '<leader>oq', function()
      client:command('ObsidianTags', { fargs = {} })
    end, { desc = '[O]bsidian [T]ags' })

    vim.keymap.set({ 'n', 'v' }, '<leader>op', function()
      local search = client:find_notes(branch_name())
      local note = nil
      local count = 0
      for _ in pairs(search) do
        count = count + 1
      end
      if count > 0 then
        note = search[1]
      else
        note = client.create_note(client, { title = branch_name(), template = 'myed_projects' })
      end
      client.open_note(client, note)
    end)
  end,
}
