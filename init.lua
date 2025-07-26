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
