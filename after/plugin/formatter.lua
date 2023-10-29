local util = require "formatter.util"

require("formatter").setup {
    logging = false,
    filetype = {
        javascript = {
            require("formatter.filetypes.javascript").prettier,
        },
        typescript = {
            require("formatter.filetypes.typescript").prettier,
        },
        typescriptreact = {
            require("formatter.filetypes.typescript").prettier,
        },
        javascriptreact = {
            require("formatter.filetypes.javascript").prettier,
        },
        json = {
            require("formatter.filetypes.json").prettier,
        },
        html = {
            require("formatter.filetypes.html").prettier,
        },
        css = {
            require("formatter.filetypes.css").prettier,
        },
        markdown = {
            require("formatter.filetypes.markdown").prettier,
        },
        ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
        }
    }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    command = "FormatWriteLock",
})
