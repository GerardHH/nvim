local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", {})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", {})
keymap("n", "<C-j>", "<C-w>j", {})
keymap("n", "<C-k>", "<C-w>k", {})
keymap("n", "<C-l>", "<C-w>l", {})

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", {})
keymap("n", "<C-Down>", ":resize +2<CR>", {})
keymap("n", "<C-Left>", ":vertical resize -2<CR>", {})
keymap("n", "<C-Right>", ":vertical resize +2<CR>", {})

-- Buffers
keymap("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })

keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", {})
keymap("n", "<A-k>", ":m .-2<CR>==", {})

-- Meta actions
keymap("n", "<leader>ch", ":checkhealth<CR>", { desc = "Check Health" })

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", {})
keymap("i", "kj", "<ESC>", {})

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", {})
keymap("v", ">", ">gv^", {})

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", {})
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", {})
keymap("v", "p", '"_dP', {})

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", {})
keymap("x", "K", ":m '<-2<CR>gv=gv", {})
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", {})
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", {})
