vim.g.mapleader = " "
vim.g.maplocalleader = " "
--  ============================================================
vim.o.hlsearch = true 						-- Set highlight on search
vim.wo.number = true 							-- Make line numbers default
vim.o.mouse = 'a' 								-- Enable mouse mode
vim.o.clipboard = 'unnamedplus' 	-- Sync clipboard between OS and Neovim.
vim.o.breakindent = true 					-- Enable break indent
vim.o.undofile = true 						-- Save undo history
vim.o.ignorecase = true 					-- Case-insensitive searching UNLESS \C or capital in search
vim.o.smartcase = true 						-- Case-insensitive searching UNLESS \C or capital in search
vim.wo.signcolumn = 'yes' 				-- Keep signcolumn on by default
vim.o.updatetime = 250 						-- Decrease update time
vim.o.timeoutlen = 300 						-- Decrease update time
vim.o.termguicolors = true 				-- NOTE: You should make sure your terminal supports this
vim.o.relativenumber = true 			-- numbers in line relative by cursor line
vim.o.wrap = false 								-- dont let text wrap if dont fit in line
vim.o.cursorline = true 					-- highlight cursor line
vim.o.tabstop=2 									-- tab size i guess
vim.o.shiftwidth=2 								-- tab size i guess
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
--  Telescope keymaps ==========================================
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>F', telescope.find_files, { desc = "find files"})
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = "find files"})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = "live grep"})
vim.keymap.set('n', '<leader><space>', telescope.buffers, { desc = "buffer files"})
-- git
vim.keymap.set('n', '<leader>fF', telescope.git_files, { desc = "git files"})
vim.keymap.set('n', '<leader>fs', telescope.git_status, { desc = "git status"})
vim.keymap.set('n', '<leader>fb', telescope.git_branches, { desc = "git branches"})
vim.keymap.set('n', '<leader>fc', telescope.git_commits, { desc = "git commits"})
--  Diagnostics keymaps ========================================
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "open float diagnostics"})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "prev diagnostic"})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "next diagnostic"})
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = "diagnostics list"})
--  Comment lines ==============================================
local function comment_stuff()
		require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
	end

vim.keymap.set('n', "<leader>/" , comment_stuff, { desc = "Toggle comment line" })
vim.keymap.set('v', "<leader>/" , "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", { desc = "Toggle comment for selection" })
--  ============================================================
vim.keymap.set('n', "<leader>z" , "ciw\"\"<esc>P<esc>b", { desc = "\"\" quote word" })
--  Terminal remapings =========================================
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
function _lazygit_toggle() lazygit:toggle() end

vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true, desc="LazyGit"})
--  ============================================================
--  ============================================================
--  Labels for [which key] =======================================
local wk = require("which-key")

wk.register({
  f =  "file",
  g =  "go to",
  c =  "code action",
	t = "terminal apps",
}, { prefix = "<leader>" })
--  ============================================================
