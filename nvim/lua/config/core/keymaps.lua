local options = { noremap = true, silent = true }

-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jj", "<ESC>", options)
keymap.set("n", "<leader>q", ":q<CR>", options)
keymap.set("n", "<leader>w", ":w<CR>", options)
keymap.set("n", "<leader><leader>d", ":bdelete<CR>", options)
keymap.set("n", "<Tab>", ":bNext<CR>", options)
keymap.set("n", "<Tab><Tab>", ":bprevious<CR>", options)
keymap.set("n", "<leader><leader>+", ":vertical resize +2<CR>", options)
keymap.set("n", "<leader><leader>-", ":vertical resize -2<CR>", options)
keymap.set("n", "<leader><leader><leader>+", ":resize +2<CR>", options)
keymap.set("n", "<leader><leader><leader>-", ":resize -2<CR>", options)
keymap.set("n", "<leader><leader>t", ":vertical terminal<CR>", options)
keymap.set("n", "<leader><leader>h", ":terminal<CR>", options)
keymap.set("n", "<ESC>", ":nohl<CR>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", options)

-- delete single character without copying into register
keymap.set("n", "x", '"_x', options)

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", options) -- incremen, optionst
keymap.set("n", "<leader>-", "<C-x>", options) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", options) -- split window verticall, optionsy
keymap.set("n", "<leader>sh", "<C-w>s", options) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", options) -- make split windows equal width & heigh, optionst
keymap.set("n", "<leader>sx", ":close<CR>", options) -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>", options) -- open new ta, optionsb
keymap.set("n", "<leader>tx", ":tabclose<CR>", options) -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>", options) --  go to next ta, optionsb
keymap.set("n", "<leader>tp", ":tabp<CR>", options) --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", options) -- toggle split window maximizatio, optionsn

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", options) -- toggle file explore, optionsr

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", options) -- find files within current working directory, respects .gitignor, optionse
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", options) -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", options) -- find string under cursor in current working director, optionsy
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", options) -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", options) -- list available help tag, optionss

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", options) -- list all git commits (use <cr> to checkout) ["gc" for git commits, options]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", options) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", options) -- list git branches (use <cr> to checkout) ["gb" for git branch, options]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", options) -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>", options) -- mapping to restart lsp if necessar, optionsy
