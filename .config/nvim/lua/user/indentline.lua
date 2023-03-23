local ok, indent_blankline = pcall(require, 'indent_blankline')
if not ok then
    vim.notify('Could not load indent_blankline!')
	return
end

indent_blankline.setup({
    char = '▏',
    use_treesitter = true,
	show_current_context = true,
    show_trailing_blankline_indent = true,
    show_first_indent_level = true,
    buftype_exclude = { 'terminal', 'nofile' },
    filetype_exclude = {
        'help',
        'startify',
        'dashboard',
        'packer',
        'neogitstatus',
        'NvimTree',
        'Trouble',
    },
    context_patterns = {
        'class',
        'return',
        'function',
        'method',
        '^if',
        '^while',
        'jsx_element',
        '^for',
        '^object',
        '^table',
        'block',
        'arguments',
        'if_statement',
        'else_clause',
        'jsx_element',
        'jsx_self_closing_element',
        'try_statement',
        'catch_clause',
        'import_statement',
        'operation_type',
    },
    use_treesitter_scope = true
})
