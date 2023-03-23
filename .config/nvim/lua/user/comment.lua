local ok, comment = pcall(require, 'Comment')
if not ok then
    vim.notify('Could not load comment!')
    return
end

comment.setup()
