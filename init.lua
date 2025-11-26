require("config.options")
require("config.keymaps")
require("config.lazy")


-- vim.diagnostic.config({
--     virtual_text = {
--         hl_mode = "replace", -- stop mixing with Comment
--         -- prefix = "●", -- whatever you like
--     },
-- })

vim.diagnostic.config({
    virtual_text = false,
    underline = true,
    signs = true,
})

vim.filetype.add({
    filename = {
        [".aliases"] = "bash",
    },
})

vim.api.nvim_create_user_command("LspClients", function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    local lines = {}
    for _, client in ipairs(clients) do
        table.insert(lines, string.format("%s (id=%d)", client.name, client.id))
    end
    vim.cmd("new")
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
end, {})
