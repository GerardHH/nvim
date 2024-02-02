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

-- Easy redo
keymap("n", "U", "<C-r>", { desc = "Redo" })

-- leader maps
-- Diagnostics,
keymap("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Diagnostics line" })
keymap("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Diagnostics next" })
keymap("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Diagnostics previous" })
-- View
keymap("n", "<leader>vh", "<CMD>checkhealth<CR>", { desc = "View health" })
keymap("n", "<leader>vl", "<CMD>Lazy<CR>", { desc = "View lazy" })
keymap("n", "<leader>vs-", "<C-w>s", { desc = "View Split window horizontally" })
keymap("n", "<leader>vs=", "<C-w>=", { desc = "View Split equal size" })
keymap("n", "<leader>vsc", "<CMD>close<CR>", { desc = "View Split close current" })
keymap("n", "<leader>vs|", "<C-w>v", { desc = "View Split window vertically" })

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
