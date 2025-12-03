
vim.g.mapleader = ' '

-- makes it possible to leave 'TERMINAL' mode with just ESC.
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-N>', { noremap = true, silent = true })

-- '<Leader>l toggles line number mode (number, relativenumber, both, off) 
vim.keymap.set('n', '<Leader>l', function()
    local n = vim.opt.number:get()
    local rn = vim.opt.relativenumber:get()
    
    local function reset_statuscolumn()
        vim.opt.statuscolumn = ''
    end

    if n and not rn then
        vim.opt.number = false
        vim.opt.relativenumber = true
        reset_statuscolumn()
    elseif not n and rn then
        vim.opt.number = true
        vim.opt.relativenumber = true
        vim.opt.statuscolumn = '%{v:lnum} %{v:relnum}'
    elseif n and rn then
        vim.opt.number = false
        vim.opt.relativenumber = false
        reset_statuscolumn()
    else
        vim.opt.number = true
        vim.opt.relativenumber = false
        reset_statuscolumn()
    end
end)

vim.api.nvim_set_keymap('v', '<Leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>yy', '"+yy', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>Y', '"+y$', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>p', '"+p', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<Leader>p', '"+p', { noremap = true, silent = true})
