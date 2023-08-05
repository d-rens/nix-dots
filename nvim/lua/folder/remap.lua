vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- ultisnips
vim.g.UltiSnipsExpandTrigger = "<c-d>"
vim.g.UltiSnipsJumpForwardTrigger = "<s-tab>"
--vim.g.UltiSnipsJumpBackwardTrigger = "<c-tab>"


vim.keymap.set("n", "<leader>w", ":w <enter>")
vim.keymap.set("n", "<leader>q", ":wq <enter>")
vim.keymap.set("n", "<leader>Q", ":wq <enter>")
vim.keymap.set("n", "<leader>l", ":VimtexCompile <enter>")


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- greatest remap ever
--vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/folder/packer.lua<CR>");
--vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- buffer
vim.keymap.set("n", "<leader>b", ":bn <enter>")
vim.keymap.set("n", "<leader>B", ":bp <enter>")
vim.keymap.set("n", "<leader>d",  ":bd <enter>")
vim.keymap.set("n", "<leader>D",  ":bd! <enter>")


-- Obsidian

vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks <enter>")
vim.keymap.set("n", "<leader>ot",":ObsidianToday <enter>")
vim.keymap.set("n", "<leader>oy",":ObsidianYesterday <enter>")
vim.keymap.set("n", "<leader>oo",":ObsidianOpen <enter>")
vim.keymap.set("n", "<leader>on",":ObsidianNew <enter>")
vim.keymap.set("n", "<leader>os",":ObsidianSearch <enter>")
vim.keymap.set("n", "<leader>ov",":ObsidianQuickSwitch <enter>")
vim.keymap.set("v", "<leader>oL",":ObsidianLink <enter>")
vim.keymap.set("v", "<leader>oLn",":ObsidianLinkNew")
vim.keymap.set("n", "<leader>of",":ObsidianFollowLink <enter>")
vim.keymap.set("n", "<leader>oT",":ObsidianTemplate <enter>")
