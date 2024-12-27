-- Terminal Colors
vim.o.termguicolors = true

-- Numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 2
vim.o.cursorline = true

-- Auto Indents & Options
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.cindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- Dont display Long lines on multiple lines
vim.o.wrap = false

-- Case Insensetive Searching Unless /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true


-- Disable Backup To Prent Clogging of Filesystem
vim.o.backup = false
vim.o.writebackup = false
