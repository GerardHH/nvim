local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", {})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
keymap("n", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Navigate to left nvim window" })
keymap("n", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Navigate to down nvim window" })
keymap("n", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Navigate to up nvim window" })
keymap("n", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Navigate to right nvim window" })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", { desc = "Expand current view horizontally" })
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = "Shrink current view horizontally" })
keymap("n", "<C-Left>", ":vertical resize +2<CR>", { desc = "Expand current view vertically" })
keymap("n", "<C-Right>", ":vertical resize -2<CR>", { desc = "Shrink current view vertically" })

keymap("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })

keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "Move text on line down" })
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = "Move text on line up" })

-- Insert --

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
