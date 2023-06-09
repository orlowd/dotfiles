local ok, lualine = pcall(require, 'lualine')
if not ok then
    vim.notify('Could not load lualine!')
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	'diagnostics',
	sources = { 'nvim_diagnostic' },
	sections = { 'error', 'warn' },
	symbols = {
        error = ' ',
        warn = ' '
    },
	colored = false,
	update_in_insert = false,
	always_visible = false,
}

local diff = {
	'diff',
	colored = false,
	symbols = { -- changes diff symbols
        added = ' ',
        modified = ' ',
        removed = ' '
    },
  cond = hide_in_width
}

local filetype = {
	'filetype',
	icons_enabled = false,
	icon = nil,
}

local branch = {
	'branch',
	icons_enabled = true,
	icon = '',
}

local location = {
	'location',
	padding = 0,
}

local gitstatus = {
    '%{get(b:, "gitsigns_status", "")}',
    cond = function()
        return vim.api.nvim_eval('get(b:, "gitsigns_status", "")') ~= ''
    end
}

local spaces = function()
	return 'spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
		disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree', 'Outline' },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = {
            branch,
            gitstatus
        },
		lualine_c = { diagnostics },
		lualine_x = { diff, spaces, 'encoding', filetype },
		lualine_y = {},
		lualine_z = { location },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
