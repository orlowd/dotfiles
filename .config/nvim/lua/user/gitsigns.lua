local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then
    vim.notify('Could not load gitsigns!')
    return
end

gitsigns.setup {
    signs = {
        add = { hl = 'GitSignsAdd', text = '▎', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        change = { hl = 'GitSignsChange', text = '▎', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        delete = { hl = 'GitSignsDelete', text = '契', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete = { hl = 'GitSignsDelete', text = '契', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = '▎', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    },
    signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
    numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        interval = 1000,
        follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 500,
        ignore_whitespace = false,
    },
    current_line_blame_formatter_opts = {
        relative_time = false,
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,
    preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
    },
    yadm = {
        enable = false,
    },
}

vim.keymap.set('n', '<leader>gtb', ':Gitsigns toggle_current_line_blame<cr>', { desc = '[G]itsigns: [T]oggle Current Line [B]lame', silent = true })
vim.keymap.set('n', '<leader>gtd', ':Gitsigns toggle_deleted<cr>', { desc = '[G]itsigns: [T]oggle [D]eleted', silent = true })
vim.keymap.set('n', '<leader>gtw', ':Gitsigns toggle_word_diff<cr>', { desc = '[G]itsigns: [T]oggle [W]ord Diff', silent = true })
vim.keymap.set('n', '<leader>gn', ':Gitsigns next_hunk<cr>', { desc = '[G]itsigns: Goto [N]ext Hunk', silent = true })
vim.keymap.set('n', '<leader>gp', ':Gitsigns prev_hunk<cr>', { desc = '[G]itsigns: Goto [P]revious Hunk', silent = true })
vim.keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk<cr>', { desc = '[G]itsigns: [S]tage Hunk', silent = true })
vim.keymap.set('n', '<leader>gr', ':Gitsigns reset_hunk<cr>', { desc = '[G]itsigns: [R]eset Hunk', silent = true })
vim.keymap.set('n', '<leader>gas', ':Gitsigns stage_buffer<cr>', { desc = '[G]itsigns: [S]tage [A]ll In Buffer', silent = true })
vim.keymap.set('n', '<leader>gar', ':Gitsigns reset_buffer<cr>', { desc = '[G]itsigns: [R]eset [A]ll In Buffer', silent = true })
