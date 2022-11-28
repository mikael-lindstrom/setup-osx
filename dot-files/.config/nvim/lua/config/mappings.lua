local map = vim.api.nvim_set_keymap

map('n', '<Space>', '', {})
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>t', '<cmd>enew<cr>')
vim.keymap.set('n', '<leader>l', '<cmd>bnext<cr>')
vim.keymap.set('n', '<leader>h', '<cmd>bprevious<cr>')
vim.keymap.set('n', '<leader>d', '<cmd>bdelete<cr>')
