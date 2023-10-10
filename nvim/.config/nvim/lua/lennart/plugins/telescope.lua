local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
    print("Telescope not installed!")
    return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
    print("Telescope.actions not installed!")
    return
end

local builtin_setup, builtin = pcall(require, "telescope.builtin")
if not builtin_setup then
    print("Telescope.builtin not installed")
    return
end

telescope.load_extension("fzf")

-- Custom Keybinds

vim.keymap.set("n", "<leader>pf", function()
    builtin.find_files({ hidden = true })
end)
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set("n", "<C-p>", builtin.git_files)
vim.keymap.set("n", "<leader>ss", builtin.current_buffer_fuzzy_find)
vim.keymap.set("n", "<leader>lr", builtin.buffers)

