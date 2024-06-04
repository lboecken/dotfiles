local lazy_cmds = vim.api.nvim_create_augroup('lazy_cmds', { clear = true })
local snapshot_dir = vim.fn.stdpath 'data' .. '/plugin-snapshot'
local lockfile = vim.fn.stdpath 'config' .. '/lazy-lock.json'

vim.api.nvim_create_user_command('BrowseSnapshots', 'edit ' .. snapshot_dir, {})

vim.api.nvim_create_autocmd('User', {
  group = lazy_cmds,
  pattern = 'LazyUpdatePre',
  desc = 'Backup lazy.nvim lockfile',
  callback = function(event)
    vim.fn.mkdir(snapshot_dir, 'p')
    local snapshot = snapshot_dir .. os.date '/%Y-%m-%dT%H:%M:%S.json'
    vim.notify('Created snapshot ' .. snapshot)

    vim.loop.fs_copyfile(lockfile, snapshot)
  end,
})
