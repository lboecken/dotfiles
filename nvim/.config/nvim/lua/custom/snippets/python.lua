local ls = require 'luasnip'
local extras = require 'luasnip.extras'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local r = extras.rep
local f = ls.function_node

ls.add_snippets('python', {
  s('bp', {
    t 'breakpoint()',
  }),
})

local function get_matching_bracket(args, parent, user_args)
  local brackets = {}
  brackets['('] = ')'
  brackets['['] = ']'
  brackets['{'] = '}'
  return brackets[args[1][1]]
end

local function toggle_mini_pairs(args, parent, user_args)
  if user_args[1] == true then
    vim.b.minipairs_disable = true
  else
    vim.b.minipairs_disable = false
  end
end

ls.add_snippets('python', {
  s('compre', {
    f(toggle_mini_pairs, { 0 }, { true }),
    i(1),
    t ' ',
    r(3),
    t ' for ',
    i(3),
    t ' in ',
    i(2),
    t ' ',
    f(get_matching_bracket, { 1 }),
    f(toggle_mini_pairs, { 0 }, { false }),
  }),
})
