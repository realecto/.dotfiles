return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.black.with({
                    extra_args = {"--line-length", "79"}
                }),
                null_ls.builtins.diagnostics.pylint.with({
                    command = vim.fn.expand("~/.pyenv/shims/pylint"),
                }),
            },
            autostart = true,
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
