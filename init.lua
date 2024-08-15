vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
require("config.lazy")
