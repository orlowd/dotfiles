-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.clipboard = "unnamedplus"   -- creates a backup file
vim.opt.cmdheight = 1               -- do not need more space in the neovim command line for displaying messages
vim.opt.completeopt = {             -- completion options
    "menuone",                      --  always show menu, even when there is only one option
    "noinsert",                     --  do not automatically insert completion
    "noselect",                     --  do not automatically select completion
}
vim.opt.fileencoding = "utf-8"      -- the encoding written to a file
vim.opt.autochdir = true            -- automatically change current directory when opening a file
vim.opt.smartcase = true			-- do case insensitive search when using only lowercase
vim.opt.smartindent = true			-- interpret tab presses depending on where the cursor is
vim.opt.expandtab = true			-- convert tabs to spaces
vim.opt.shiftwidth = 4				-- the number of spaces inserted for each indentation
vim.opt.tabstop = 4				    -- the number of spaces inserted for a tab
vim.opt.hlsearch = true				-- highlight all matches on previous search pattern
vim.opt.ignorecase = true			-- ignore case in search patterns
vim.opt.mouse = "a"				    -- allow the mouse to be used in neovim
vim.opt.pumheight = 10				-- pop up menu height
vim.opt.showtabline = 1  			-- show tabs line only if there is more than one open
vim.opt.splitbelow = true			-- force all horizontal splits to go below current window
vim.opt.splitright = true			-- force all vertical splits to go to the right of current window
vim.opt.timeoutlen = 1000			-- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true				-- enable persistent undo
vim.opt.updatetime = 250			-- faster completion (4000ms default)
vim.opt.cursorline = true			-- highlight the current line
vim.opt.number = true				-- set numbered lines
vim.opt.wrap = true				    -- wrap big lines
vim.opt.scrolloff = 8				-- leave at least 8 lines visible above the cursor when scrolling
vim.opt.sidescrolloff = 8			-- same for vertical scroll
vim.opt.signcolumn = "yes:1"        -- show signs (including diagnostics) in the separate column
