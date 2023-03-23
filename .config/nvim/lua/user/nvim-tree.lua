local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then
    vim.notify('Could not load nvim-tree!')
    return
end

nvim_tree.setup {
    disable_netrw = true,
    hijack_cursor = true,
    update_cwd = true,
    renderer = {
        icons = {
            glyphs = {
                default = '',
                symlink = '',
                git = {
                    unstaged = '',
                    staged = 'S',
                    unmerged = '',
                    renamed = '➜',
                    deleted = '',
                    untracked = 'U',
                    ignored = '◌',
                },
                folder = {
                    default = '',
                    open = '',
                    empty = '',
                    empty_open = '',
                    symlink = '',
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = '',
            info = '',
            warning = '',
            error = '',
        },
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    view = {
        width = 35,
        mappings = {
            list = {
                { key = { 'l', '<CR>', 'o' }, action = 'edit' },
                { key = 'h', action = 'close_node' },
                { key = 's', action = 'split' },
                { key = 'v', action = 'vsplit' },
                { key = 't', action = 'tabnew' },
                { key = '<C-s>', action = 'system_open' },
            },
        },
    },
}

vim.keymap.set('n', '<leader>m', ':NvimTreeToggle<cr>', { silent = true })
vim.keymap.set('n', '<leader>l', ':NvimTreeFindFile<cr>', { silent = true })
