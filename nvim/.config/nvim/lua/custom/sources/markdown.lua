local have_cmp, cmp = pcall(require, 'cmp')
if not have_cmp then
  vim.notify 'Unable to load nvim-cmp for markdown'
  return
end

local have_obsidian, obsidian = pcall(require, 'obsidian')
if not have_obsidian then
  vim.notify 'Unable to load obsidian for nvim-comp for markdown'
  return
end

local obsidian_client = obsidian.get_client()

local source = {}

source.keyword_length = 1
source.new = function()
  return setmetatable({}, { __index = source })
end

source.get_trigger_characters = function()
  return { '#' }
end

source.complete = function(_, callback)
  local tags = obsidian_client:list_tags()
  local items = {}
  for _, v in ipairs(tags) do
    table.insert(items, {
      label = v,
    })
  end
  callback { items = items }
end

cmp.register_source('handles', source.new())
