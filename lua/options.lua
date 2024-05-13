vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.nofsync = true

-- General
vim.opt.mouse = 'a' -- use mouse in all modes
vim.opt.clipboard = 'unnamedplus' -- include system clipboard
vim.opt.undofile = true
vim.opt.timeoutlen = 300

-- UI
vim.opt.number = true -- line numbers
vim.opt.relativenumber = true
vim.opt.scrolloff = 10 -- keep x number of lines above and below cursor when scrolling
vim.opt.signcolumn = 'yes' -- always show sign column
vim.opt.showmatch = true -- matching parenthesis
vim.opt.showmode = false -- don't show mode in command line, as status line shows it
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if searching with capital letter, then don't ignore case
vim.opt.laststatus = 3 -- show status line on last window
vim.opt.cursorline = true -- show line cursor is on
vim.opt.inccommand = 'split' -- previews substitutions as you type them
vim.opt.termguicolors = true
vim.opt.hlsearch = true

-- indents
vim.opt.expandtab = true
vim.opt.shiftwidth = 4 -- shift 4 spaces when we tab
vim.opt.tabstop = 4 -- 1 tab = 4 spaces
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.smartindent = true -- autoindent new lines


