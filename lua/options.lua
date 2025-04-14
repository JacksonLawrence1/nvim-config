-- Set <leader> to Spacebar
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.nofsync = true

-- General
vim.opt.mouse = 'a' -- use mouse in all modes
vim.opt.clipboard = 'unnamedplus' -- include system clipboard
vim.opt.undofile = true
vim.opt.timeoutlen = 300

-- Terminal
-- Only alter windows behavior
if vim.fn.has("win32") == 1 then
  vim.o.shell = "pwsh"
  vim.o.shellcmdflag = "-NoProfile -NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';$PSStyle.OutputRendering = [System.Management.Automation.OutputRendering]::PlainText;"
  vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end

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

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4 -- shift 4 spaces when we tab
vim.opt.tabstop = 4 -- 1 tab = 4 spaces
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.smartindent = true -- autoindent new lines
vim.opt.autoindent = true -- copy indent from current line when starting a new linear
vim.opt.shiftround = true -- round indent to multiple of shiftwidth

-- Diagnostics
vim.diagnostic.config({ jump = { float = true }})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
