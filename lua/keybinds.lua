-- Save with CTRL s
vim.keymap.set("n", "<C-s>", vim.cmd.up, { desc = "Save" })

-- Window navigation
vim.keymap.set({"n", "t"}, "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set({"n", "t"}, "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set({"n", "t"}, "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set({"n", "t"}, "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

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
vim.keymap.set("n", "<leader>se", vim.diagnostic.open_float, { desc = "[S]how [E]rror" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open [Q]uickfixes" })

-- Copy whole file without losing cursor position
vim.keymap.set("n", "<leader>yf", "m`ggyG``", { desc = "[Y]ank [F]ile" })

-- Replace whole file with clipboard, without replacing the clipboard 
vim.keymap.set("n", "<leader>Rf", "gg\"_dGP", { desc = "[R]eplace [F]ile with clipboard" })


-- Toggle case of entire word
vim.keymap.set("n", "<leader>cc", "m`g~iw``", { desc = "[C]hange [C]ase" })

-- Capitalize first letter of word
vim.keymap.set("n", "<leader>cf", "m`lb~``", { desc = "[C]apitalize [F]irst letter of word" })


-- use "cc" when entering a line with no whitespace
-- https://github.com/nvim-lua/kickstart.nvim/issues/1365
local function AutoIndentLine(key)
    local current_line = vim.api.nvim_get_current_line()
    -- %g all printable characters except whitespace
    if string.len(current_line) == 0 or string.match(current_line, '%g') == nil then
        return [["_cc]]
    else
        return key
    end
end

-- Re-entering line auto-indents for these keys
local autoIndentKeys = { 'a', 'A', 'i', 'I'}
for _, key in ipairs(autoIndentKeys) do
    vim.keymap.set('n', key, function() return AutoIndentLine(key) end, { noremap = true, expr = true })
end
