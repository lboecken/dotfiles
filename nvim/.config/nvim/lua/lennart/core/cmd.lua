vim.api.nvim_create_user_command('Ps', function()
    local date = os.date("%d%m%y%H%M")
    local log_name = date .. ".json"
    require('packer').snapshot(log_name)
    print('Packer Snapshot taken & PackerSync executed')
end, {nargs = 0})
