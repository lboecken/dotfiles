local ls = require 'luasnip'
local s = ls.snippet
local f = ls.function_node

local function datetime(_, _, _)
  local date = os.date '%a, %b %d, %Y'
  return date
end

ls.add_snippets('markdown', {
  s('today', {
    f(datetime, _, _),
  }),
})
