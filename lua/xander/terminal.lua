local term_buf = 0
local term_win = 0

function TermToggle()
    if vim.fn.win_gotoid(term_win) == 1 then
        vim.cmd("hide")
    else
        vim.cmd("botright vnew")
        vim.cmd("vertical resize " .. 60)
        local success, _ = pcall(function()
            vim.cmd("buffer " .. term_buf)
        end)

        if not success then
            vim.fn.termopen(vim.o.shell, { detach = 0 })
            term_buf = vim.fn.bufnr("")
            vim.opt.number = false
            vim.opt.relativenumber = false
            vim.opt.signcolumn = "no"
        end

        vim.cmd("startinsert!")
        term_win = vim.fn.win_getid()
    end
end

vim.api.nvim_set_keymap('n', '<A-t>', ':lua TermToggle()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-t>', '<Esc>:lua TermToggle()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-t>', '<C-\\><C-n>:lua TermToggle(12)<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('t', ':q!', '<C-\\><C-n>:q!<CR>', { noremap = true })

