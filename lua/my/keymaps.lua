-- makes it possible to leave 'TERMINAL' mode with just ESC.
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-N>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "call system('xkb-switch -s us')",
})

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

-- Copy SELECTION system clipboard
vim.api.nvim_set_keymap('v', '<Leader>y', '"+y', { noremap = true, silent = true })
-- Same, but LINE
vim.api.nvim_set_keymap('n', '<Leader>yy', '"+yy', { noremap = true, silent = true })
-- Same, but from CURSOR to the END of line
vim.api.nvim_set_keymap('n', '<Leader>Y', '"+y$', { noremap = true, silent = true })

-- Paste from system clipboard after the cursor
vim.api.nvim_set_keymap('n', '<Leader>p', '"+p', { noremap = true, silent = true})
-- Same, but ovewrites selection
vim.api.nvim_set_keymap('v', '<Leader>p', '"+p', { noremap = true, silent = true})

-- Delete the current line without copying it to buffer
vim.api.nvim_set_keymap('n', '<Leader>d', '"_dd', { noremap = true, silent = true})
-- Same, but deletes highlighted selection
vim.api.nvim_set_keymap('v', '<Leader>d', '"_d', { noremap = true, silent = true})

-- Change the current line without copying it
vim.api.nvim_set_keymap('n', '<Leader>c', '"_cc', { noremap = true, silent = true}) 
-- Same, but changes the highlighted selection
vim.api.nvim_set_keymap('v', '<Leader>c', '"_c', { noremap = true, silent = true}) 


