-- Entry point: each require loads lua/<name>/init.lua
require("core")

-- vim.pack and vim.lsp.enable need Neovim 0.12+
if vim.fn.has("nvim-0.12") == 0 then
    vim.notify("Neovim 0.12+ required for plugins and LSP; skipping them", vim.log.levels.WARN)
    return
end

require("plugins")
require("lsp")
