local autopairs_ok, npairs = pcall(require, 'nvim-autopairs')
if not autopairs_ok then
    vim.notify('Could not load autopairs!')
    return
end

npairs.setup {
    check_ts = true,
    ts_config = {
        lua = { 'string', 'source' },
        javascript = { 'string', 'template_string' },
        java = false,
    },
    disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
    fast_wrap = {
    map = '<M-e>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = string.gsub([[ [%'%'%)%>%]%)%}%,] ]], '%s+', ''),
    offset = 0, -- Offset from pattern match
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'PmenuSel',
    highlight_grey = 'LineNr',
    },
}

local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
    print 'Could not load cmp!'
    return
end
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })