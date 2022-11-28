vim.g.airline_theme = 'onedark'
vim.g['airline#extensible#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#formatter'] = 'unique_tail_improved'
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#buffer_nr_show'] = 1
vim.g['airline#extensions#tabline#left_sep'] = ' '
vim.g['airline#extensions#tabline#left_alt_sep'] = '|'

vim.g.airline_powerline_fonts = 1
vim.g.airline_left_sep = ''
vim.g.airline_left_alt_sep = ''
vim.g.airline_right_sep = ''
vim.g.airline_right_alt_sep = ''
vim.g.airline_powerline_fonts = 1

vim.g.airline_symbols = {
    linenr = ' L:',
    modified = '+',
    whitespace = '☲',
    branch = '',
    ellipsis = '...',
    paste = 'PASTE',
    maxlinenr = '',
    readonly = '',
    spell = 'SPELL',
    space = ' ',
    dirty = '⚡',
    colnr = ' C:',
    keymap = 'Keymap:',
    crypt = '🔒',
    notexists = 'Ɇ'
}
