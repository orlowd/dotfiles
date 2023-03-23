local ok, material = pcall(require, "material")
if not ok then
    print "Failed to load material colorscheme!"
    return
end

material.setup({
    lualine_style = "default",
    custom_highlights = {
        IndentBlanklineSpaceCharBlankline = { fg='#474747', nocombine=true },
        IndentBlanklineSpaceChar = { fg='#474747', nocombine=true },
        IndentBlanklineChar = { fg='#474747', nocombine=true }
    }
})

vim.g.material_style = "darker"
vim.cmd "colorscheme material"
