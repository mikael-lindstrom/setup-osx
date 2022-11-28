require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "jsonnet_ls", "terraformls", "rust_analyzer" }
})
