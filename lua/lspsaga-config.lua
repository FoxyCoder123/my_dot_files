local keymap = vim.keymap.set
local saga = require('lspsaga')

saga.init_lsp_saga {
    server_filetype_map = {}
}

local opts = { noremap = true, silent = true }
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>",opts)
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>",opts)
keymap("n", "gr", "<cmd>Lspsaga rename<CR>",opts)
keymap("n", "<C-n>", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
keymap("n", "<C-m>", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
keymap("i", "<C-k>", "<cmd>Lspsaga signature_help<cr>", opts)
keymap("n", "gd", "<cmd>Lspsaga peek_definition<cr>", opts)
