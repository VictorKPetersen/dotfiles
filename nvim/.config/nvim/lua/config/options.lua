-- Terminal Colors
vim.o.termguicolors = true

-- Line Numbers 
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

-- Auto Indents and Tab space
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.cindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- Disable line wrap
vim.o.wrap = false

-- Turn on smart case for search
vim.o.ignorecase = true
vim.o.smartcase = true

-- No Backups
vim.o.backup = false
vim.o.writebackup = false

-- Scrolloff
vim.o.scrolloff = 3

-- When jumping go to where the buffer was left
vim.o.jumpoptions = "stack,view"
