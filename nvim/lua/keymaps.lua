vim.g.mapleader = " "
vim.g.maplocalleader = " "
--  ============================================================
vim.o.hlsearch = true -- Set highlight on search
vim.wo.number = true -- Make line numbers default
vim.o.mouse = 'a' -- Enable mouse mode
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
vim.o.breakindent = true -- Enable break indent
vim.o.undofile = true -- Save undo history
vim.o.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search
vim.o.smartcase = true -- Case-insensitive searching UNLESS \C or capital in search
vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 300 -- Decrease update time
-- vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.o.termguicolors = true -- NOTE: You should make sure your terminal supports this
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.cursorline = true
vim.o.tabstop=2
vim.o.shiftwidth=2
--  Telescope keymaps ==========================================
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader><Space>', telescope.find_files, { desc = "find files"})
vim.keymap.set('n', '<leader>/', telescope.live_grep, { desc = ""})
vim.keymap.set('n', '<leader>t', telescope.buffers, { desc = ""})
-- git
vim.keymap.set('n', '<leader>tg', telescope.git_files, { desc = "git files"})
vim.keymap.set('n', '<leader>tgs', telescope.git_status, { desc = "git status"})
vim.keymap.set('n', '<leader>tgt', telescope.git_branches, { desc = "git branches"})
vim.keymap.set('n', '<leader>tgc', telescope.git_commits, { desc = "git commits"})
--  Diagnostics keymaps ========================================
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "open float diagnostics"})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "prev diagnostic"})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "next diagnostic"})
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = "diagnostics list"})
--  ============================================================
--  ============================================================
