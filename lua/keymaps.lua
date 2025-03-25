local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", {})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- buffer
keymap("n", "H", "<CMD>bprevious<CR>", { desc = "Previous buffer" })
keymap("n", "L", "<CMD>bnext<CR>", { desc = "Next buffer" })

keymap("n", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Navigate to left nvim window" })
keymap("n", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Navigate to down nvim window" })
keymap("n", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Navigate to up nvim window" })
keymap("n", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Navigate to right nvim window" })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", { desc = "Expand current view horizontally" })
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = "Shrink current view horizontally" })
keymap("n", "<C-Left>", ":vertical resize +2<CR>", { desc = "Expand current view vertically" })
keymap("n", "<C-Right>", ":vertical resize -2<CR>", { desc = "Shrink current view vertically" })

-- Easy redo
keymap("n", "U", "<C-r>", { desc = "Redo" })

-- leader maps
keymap("n", "<leader>B", "<CMD>bdelete %<CR>", { desc = "Close current buffer" })
-- View
keymap("n", "<leader>vh", "<CMD>checkhealth<CR>", { desc = "View health" })
keymap("n", "<leader>vl", "<CMD>Lazy<CR>", { desc = "View lazy" })
keymap("n", "<leader>vm", "<CMD>messages<CR>", { desc = "View messages" })
keymap("n", "<leader>vs-", "<C-w>s", { desc = "View Split window horizontally" })
keymap("n", "<leader>vs/", "<C-w>v", { desc = "View Split window vertically" })
keymap("n", "<leader>vs=", "<C-w>=", { desc = "View Split equal size" })
keymap("n", "<leader>vsc", "<CMD>close<CR>", { desc = "View Split close current" })
-- Writing
keymap("n", "<leader>W", "<CMD>wa<CR>", { desc = "Write all" })
keymap("n", "<leader>w", "<CMD>w<CR>", { desc = "Write" })
