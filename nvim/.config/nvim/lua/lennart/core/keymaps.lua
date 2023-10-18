vim.g.mapleader = " "

-- File Explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Movement of lines while highlighting 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move below line to end of current
vim.keymap.set("n", "J", "mzJ`z")

-- Half page movement while remain in middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search terms remain in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- save files
vim.keymap.set({"n", "v"},"<leader>fs", ":w<CR>" )
vim.keymap.set({"n", "v"},"<leader>fS", ":wall<CR>" )

-- paste over word w/o losing original paste
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank to sys clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- kill Q
vim.keymap.set("n", "Q", "<nop>")

-- Broken....
vim.keymap.set("n", "<C-f>", "<cmd>silent !~/bin/tmux_sessionizer<CR>")

-- Format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Not sure....yet
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- Source file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
