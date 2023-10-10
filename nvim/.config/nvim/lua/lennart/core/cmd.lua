vim.api.nvim_create_user_command('Ps', function()
    local date = os.date("%d%m%y%H%M")
    local log_name = date .. ".json"
    local packer_status, packer = pcall(require, 'packer')
    if not packer_status then
        print('Packer not installed')
        return
    end
    packer.snapshot(log_name)
    print('Packer Snapshot taken')
    packer.sync()
end, { nargs = 0 })
