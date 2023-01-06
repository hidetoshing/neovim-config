local opt = vim.opt -- to set options

-- basic options

opt.backspace = { "indent", "eol", "start" }
opt.cursorline = true
-- opt.cursorcolumn = true
opt.encoding = "utf-8" -- Set default encoding to UTF-8
opt.foldenable = true
opt.foldmethod = "manual"
opt.incsearch = true -- Shows the match while typing

opt.number = true -- Show line numbers

-- default tab size and indent size
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4

opt.title = true -- Allows neovom to send the Terminal details of the current window, instead of just getting 'v'

-- setup leader key
vim.g.mapleader = ","