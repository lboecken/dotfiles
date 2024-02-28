local status, lualine = pcall(require, "lualine")
if not status then
    print("lualine not installed")
    return
end

lualine.setup({
    options = { theme = 'ayu_mirage', },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            {
                'filename',
                path = 1,
            }
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
})
