vim.filetype.add({
    extension = {
        -- Map .libsonnet files to jsonnet filetype
        -- https://github.com/neovim/neovim/pull/20753
        libsonnet = "jsonnet",
    }
})
