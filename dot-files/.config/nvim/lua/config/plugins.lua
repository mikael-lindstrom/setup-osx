-- Indicate first time installation
local packer_bootstrap = false

-- Check if packer.nvim is installed
local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        packer_bootstrap = fn.system {
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path,
        }
        vim.cmd("packadd packer.nvim")
    end
    -- Run PackerCompile if there are changes in this file
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
        pattern = { 'plugins..lua' },
        command = 'source <afile> | PackerCompile',
    })
end

-- Plugins
local function plugins(use)
    use("wbthomason/packer.nvim")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("joshdick/onedark.vim")
    use("vim-airline/vim-airline")
    use("vim-airline/vim-airline-themes")
    use("L3MON4D3/LuaSnip")

    use {
        "nvim-telescope/telescope.nvim",
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

    if packer_bootstrap then
        print "Restart Neovim required after installation!"
        require("packer").sync()
    end
end

packer_init()

local packer = require "packer"
local packer_conf = {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}
packer.init(packer_conf)
packer.startup(plugins)
