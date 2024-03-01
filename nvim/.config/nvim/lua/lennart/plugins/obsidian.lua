local setup, obsidian = pcall(require, 'obsidian')
if not setup then
    print("obsidian is not installed")
    return
end



obsidian.setup({
    workspaces = {
        {
            name = 'zettelkasten',
            path = '~/zettelkasten',
        },
    },
    daily_notes = {
        folder = "dailies",
        date_format = "%d-%b-%y"
    },
    note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        local suffix = ""
        -- 4 Char suffix just in case I accidentally try to create a collision
        for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
        end
        return tostring(os.date("%Y%m%d-%H%M")) .. "-" .. suffix
    end,
})

-- Needs to be called AFTER obsidian.setup
local client_setup, client = pcall(obsidian.get_client)
if not client_setup then
    print("obsidian.get_client() failed.")
    return
end

-- Custom Keybinds
vim.keymap.set("n", "<leader>on", function()
    local note = client.create_note(client)
    client.open_note(client, note)
end)

vim.keymap.set("n", "<leader>ot", function()
    local note = client.today(client)
    client.open_note(client, note)
end)

vim.keymap.set("n", "<leader>oq", function()
    client:command("ObsidianTags", {fargs = {}})
end
)
