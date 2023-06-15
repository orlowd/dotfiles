local ok, neodev = pcall(require, 'neodev')
if not ok then
    print 'Could not load neodev!'
    return
end
neodev.setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not ok then
    print 'Could not load cmp_nvim_lsp!'
    return
end
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local ok, mason = pcall(require, 'mason')
if not ok then
    print 'Could not load mason!'
    return
end
mason.setup({
    ui = {
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗'
        }
    }
})

local servers = {
    clangd = {},
    rust_analyzer = {},
    pyright = {},
    gopls = {},
    omnisharp = {},
    tsserver = {},
    zls = {},
    bashls = {},
    asm_lsp = {},
    html = {},
    cssls = {},

    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ok then
    print 'Could not load mason-lspconfig!'
    return
end
mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = false,
})

local telescope = require('telescope.builtin')

local on_attach = function(_, bufnr)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'LSP: [R]e[n]ame' })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'LSP: [C]ode [A]ction' })

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'LSP: [G]oto [D]efinition' })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'LSP: [G]oto [D]eclaration' })
    vim.keymap.set('n', 'gr', telescope.lsp_references, { buffer = bufnr, desc = 'LSP: [G]oto [R]eferences' })
    vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { buffer = bufnr, desc = 'LSP: [G]oto [I]mplementation' })
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { buffer = bufnr, desc = 'LSP: Type [D]efinition' })
    vim.keymap.set('n', '<leader>ds', telescope.lsp_document_symbols, { buffer = bufnr, desc = 'LSP: [D]ocument [S]ymbols' })
    vim.keymap.set('n', '<leader>ws', telescope.lsp_dynamic_workspace_symbols, { buffer = bufnr, desc = 'LSP: [W]orkspace [S]ymbols' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'LSP: Hover Documentation' })
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = 'LSP: Signature Documentation' })

    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { buffer = bufnr, desc = 'LSP: [W]orkspace [A]dd Folder' })
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { buffer = bufnr, desc = 'LSP: [W]orkspace [R]emove Folder' })
    vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { buffer = bufnr, desc = 'LSP: [W]orkspace [L]ist Folders' })

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
    print 'Could not load lspconfig!'
    return
end
mason_lspconfig.setup_handlers {
    function(server)
        lspconfig[server].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server],
        }
    end,
}

local ok, mason_null_ls = pcall(require, 'mason-null-ls')
if not ok then
    print 'Could not load mason-null-ls!'
    return
end
mason_null_ls.setup({
    automatic_installation = false,
    automatic_setup = true,
})

local ok, null_ls = pcall(require, 'null-ls')
if not ok then
    print 'Could not load null-ls!'
    return
end
null_ls.setup()

local ok, fidget = pcall(require, 'fidget')
if not ok then
    print 'Could not load fidget!'
    return
end
fidget.setup()

local ok, rust_tools = pcall(require, 'rust-tools')
if not ok then
    print 'Could not load rust-tools!'
    return
end
rust_tools.setup({
    server = {
        on_attach = on_attach
    }
})

local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
    { name = 'DiagnosticSignInfo', text = '' },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, {
        texthl = sign.name,
        text = sign.text,
        numhl = ''
    })
end

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})
