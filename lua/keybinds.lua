-- Save with CTRL s
vim.keymap.set("n", "<C-s>", vim.cmd.up, { desc = "Save" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Move visual selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor central when scrolling using <C-d> and <C-u>
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- clear search highlights with <Esc>
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')


-- change paste behaviour in visual mode so it doesn't lose clipboard
vim.keymap.set("v", "p", "\"_dP", { desc = "Paste over visual selection" })
-- default behaviour by pressing <leader>p
vim.keymap.set("v", "<leader>p", "p", { desc = "Default paste over visual selection" })

-- Going through Error Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>se", vim.diagnostic.open_float, { desc = "[S]how diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

