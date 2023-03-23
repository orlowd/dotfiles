local ok, _ = pcall(require, "impatient")
if not ok then
    vim.notify("Could not load impatient!")
    return
end
