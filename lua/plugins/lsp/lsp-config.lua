return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        -- Set up Mason
        require("mason").setup()

        -- Set up Mason LSPConfig
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "ts_ls",
                -- add more LSPs you want
            },
            automatic_installation = true,
            automatic_enable = true, -- enables automatic setup of installed servers
        })

        -- Optional: nvim-cmp support
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

        -- Use vim.lsp.config to set per-server options
        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                },
            },
        })

        vim.lsp.config("pyright", {
            capabilities = capabilities,
        })

        vim.lsp.config("ts_ls", {
            capabilities = capabilities,

        })

        -- Keymaps for LSP
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration" })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Go to references" })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover documentation" })
    end,
}
