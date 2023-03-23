local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    vim.notify('Could not load nvim-treesitter!')
    return
end

configs.setup {
    sync_install = false,
    ensure_installed = {
        'c',
        'cpp',
        'lua',
        'python',
        'bash',
        'rust',
        'go',
        'zig',
        'typescript',
        'html',
        'css'
    },

    highlight = { enable = true },
    indent = { enable = true, disable = { 'yaml', 'python' } },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<C-space>',
            node_incremental = '<C-space>',
            scope_incremental = '<C-s>',
            node_decremental = '<backspace>',
        },
    },

    autopairs = { enable = true },

    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },

    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
                ['<leader>A'] = '@parameter.inner',
            },
        },
    },
}
