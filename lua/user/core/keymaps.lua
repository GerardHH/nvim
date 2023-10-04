local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", {})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
keymap("n", "<C-h>", "<C-w>h", { desc = "Navigate to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Navigate to down window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Navigate to up window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Navigate to right window" })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", { desc = "Expand current view horizontally" })
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = "Shrink current view horizontally" })
keymap("n", "<C-Left>", ":vertical resize +2<CR>", { desc = "Expand current view vertically" })
keymap("n", "<C-Right>", ":vertical resize -2<CR>", { desc = "Shrink current view vertically" })

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

keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "Move text on line down" })
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = "Move text on line up" })

-- Insert --
keymap("i", "jk", "<ESC>", { desc = "Exit insert mode" })
keymap("i", "kj", "<ESC>", { desc = "Exit insert mode" })

-- Visual --
keymap("v", "<", "<gv^", { desc = "Indent selected text to the left" })
keymap("v", ">", ">gv^", { desc = "Indent selected text to the right" })

keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected text up" })
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected text down" })

keymap("v", "p", '"_dP', { desc = "Replace selection with buffer" })

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text up" })
keymap("x", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text down" })
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected text up" })
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected text down" })
