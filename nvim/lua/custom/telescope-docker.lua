local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values

-- our picker function: colors
local colors = function(opts)
  opts = opts or {}
  pickers
    .new(opts, {
      prompt_title = 'docker containers',
      finder = finders.new_table {
        results = { { 'red', 'test' }, { 'green', 'blah' }, { 'blue', 'asdf' } },
        entry_maker = function(entry)
          return {
            value = entry,
            display = entry[1],
            ordinal = entry[1],
          }
        end,
      },
    })
    :find()
end

-- to execute the function
colors()
