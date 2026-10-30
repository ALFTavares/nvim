-- Language servers, configured with the built-in vim.lsp API.
-- Per-server overrides go in lsp/<server>.lua at the config root
-- (picked up automatically by vim.lsp.config), or inline below.

-- Servers to enable; each must be installed on the system,
-- e.g. "lua_ls" (lua-language-server), "pyright", "bashls".
local servers = { "marksman" }

vim.lsp.enable(servers)

vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp", { clear = true }),
    callback = function(args)
        local map = function(keys, fn, desc)
            vim.keymap.set("n", keys, fn, { buffer = args.buf, desc = desc })
        end

        map("gd", vim.lsp.buf.definition, "Go to definition")
        map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map("<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("<leader>f", function()
            vim.lsp.buf.format({ async = true })
        end, "Format buffer")
    end,
})
