local lsp_config = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

local on_attach = function(_, bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'vd', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>td', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

lsp_config.util.default_config = vim.tbl_extend("force", lsp_config.util.default_config, {
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities),
})


lsp_config.terraformls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
        experimentalFeatures = {
            validateOnSave = false,
            prefillRequiredFields = true,
        },
    },
}

lsp_config.jsonnet_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

lsp_config.rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "rustup", "run", "nightly", "rust-analyzer" },
}

lsp_config.sumneko_lua.setup {
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
            },
        },
    },
}

-- Autoformat on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*.tf", "*.tfvars", "*.jsonnet", "*.libsonnet", "*.lua", "*.rs" },
    command = "lua vim.lsp.buf.format()",
})
