local function branch_name()
  local branch = vim.fn.system "git branch --show-current 2> /dev/null | tr -d '\n'"
  if branch ~= '' then
    return branch
  else
    return ''
  end
end

local status, builtin = pcall(require, 'telescope.builtin')

return {
  'epwalsh/obsidian.nvim',
  config = function()
    require('obsidian').setup {
      workspaces = {
        {
          name = 'pkm',
          path = vim.fn.expand '$HOME' .. '/pkm',
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
      overrides = {
        notes_subdir = 'inbox',
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
    if not client then
      vim.notify 'Unable to load client for Obsidian'
      return
    end
    local picker = client:picker 'telescope.nvim'
    if not picker then
      vim.notify 'Unable to load picker for Obsidian'
      return
    end
    local t_pickers = require 'telescope.pickers'
    local t_finders = require 'telescope.finders'
    local t_previewers = require 'telescope.previewers'

    vim.keymap.set({ 'n', 'v' }, '<leader>op', function()
      -- Get all files in a certain path
      local tags = client:list_tags 'project/'
      picker:pick_tag(tags, {
        callback = function(tag)
          local files = client:find_notes(tag)
          if not files then
            return
          end
          t_pickers
            .new({}, {
              prompt_title = tag,
              finder = t_finders.new_table {
                title = 'Files',
                results = files,
                entry_maker = function(entry)
                  return {
                    value = entry,
                    display = entry.path.filename,
                    ordinal = entry,
                  }
                end,
              },
              -- TODO: Search does not take keystroke input.
              -- Do a grep search of the files something like that
              previewer = t_previewers.new_termopen_previewer {
                title = 'Preview',
                get_command = function(entry, status)
                  return { 'less', entry.display }
                end,
              },
            })
            :find()
        end,
      })
    end, { desc = 'Search projects' })

    -- TODO: refactor this keybind and the <leader>op one to use the same func
    -- under the hod
    vim.keymap.set({ 'n', 'v' }, '<leader>oa', function()
      -- Get all files in a certain path
      local tags = client:list_tags 'area/'
      picker:pick_tag(tags, {
        callback = function(tag)
          local files = client:find_notes(tag)
          if not files then
            return
          end
          t_pickers
            .new({}, {
              prompt_title = tag,
              finder = t_finders.new_table {
                title = 'Files',
                results = files,
                entry_maker = function(entry)
                  return {
                    value = entry,
                    display = entry.path.filename,
                    ordinal = entry,
                  }
                end,
              },
              -- TODO: Search does not take keystroke input.
              -- Do a grep search of the files something like that
              previewer = t_previewers.new_termopen_previewer {
                title = 'Preview',
                get_command = function(entry, status)
                  return { 'less', entry.display }
                end,
              },
            })
            :find()
        end,
      })
    end, { desc = 'Search areas' })

    vim.keymap.set('n', '<leader>on', function()
      local note = client:create_note {
        template = 'note',
        dir = './inbox/',
      }
      client:open_note(note)
    end, { desc = 'Create new note in inbox' })

    -- vim.keymap.set('n', '<leader>ot', function()
    --   local note = client:today()
    --   client:open_note(note)
    -- end, { desc = '[O]bsidian [T]oday' })

    vim.keymap.set('n', '<leader>ot', function()
      client:command('ObsidianTags', { fargs = {} })
    end, { desc = 'Search Tags' })

    vim.keymap.set({ 'n', 'v' }, '<leader>og', ':ObsidianSearch<CR>', { desc = '[G]rep [O]bsidian notes' })
    vim.keymap.set({ 'n', 'v' }, '<leader>of', ':ObsidianQuickSwitch<CR>', { desc = 'Search notes by path' })
    vim.keymap.set({ 'n', 'v' }, '<leader>ob', ':ObsidianBacklinks<CR>', { desc = 'Find backlinks for current note' })

    vim.keymap.set({ 'n', 'v' }, '<leader>oP', function()
      local note = client:create_note { dir = 'inbox', template = 'project' }
      client:open_note(note)
    end, { desc = 'New project note' })

    vim.keymap.set({ 'n', 'v' }, '<leader>ol', function()
      -- Get link under cursor
      -- Check if internal or external
      -- External -> Not supported / yank to clip for now
      -- Internal open note in current buffer
    end, { desc = 'Follow link' })
    vim.keymap.set('n', '<leader>oL', function()
      local search = client:find_notes 'Learning Log'
      local note = nil
      local count = 0
      for _ in pairs(search) do
        count = count + 1
      end
      if count > 0 then
        note = search[1]
      else
        note = client.create_note(client, { title = 'Learning Log' })
      end
      client:open_note(note)
    end, { desc = 'Open Learning Log' })
  end,
}
