--[[

=====================================================================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

--]]
-- [[ core config ]]
require 'core.options'
require 'core.keymaps'

-- [[ lazy config bootstrap ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ lazy plugins ]]

--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup {
  'christoomey/vim-tmux-navigator',
  -- Adjust 'shiftwidth' and 'expandtab' based on project context
  { 'tpope/vim-sleuth' },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  -- vim/tmux navigator

  require 'plugins.neoscroll',

  require 'plugins.gitsigns',

  require 'plugins.which-key',

  require 'plugins.telescope',

  require 'plugins.lspconfig',

  require 'plugins.conform',

  require 'plugins.nvim-comp',

  require 'plugins.tokyonight',

  require 'plugins.todo-comments',

  require 'plugins.mini',

  require 'plugins.treesitter',

  require 'plugins.harpoon',

  require 'plugins.nvim-toggler',

  require 'plugins.nvim-tree',

  require 'plugins.noice',

  require 'plugins.obsidian',

  { 'jamestthompson3/nvim-remote-containers' },

  { 'tpope/vim-fugitive' },

  { 'tpope/vim-dadbod' },

  { 'kristijanhusak/vim-dadbod-ui' },

  { 'kristijanhusak/vim-dadbod-completion' },

  -- require 'custom.c_autocompile',

  -- require 'custom.snap_test_runner',
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts:2 sts:2 sw:2 et
