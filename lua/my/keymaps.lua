-- makes it possible to leave 'TERMINAL' mode with just ESC. vim.keymap.set('t', '<Esc>', '<C-\\><C-N>', {silent = true })

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
vim.keymap.set('v', '<Leader>y', '"+y', {silent = true })
-- Same, but LINE
vim.keymap.set('n', '<Leader>yy', '"+yy', {silent = true })
-- Same, but from CURSOR to the END of line
vim.keymap.set('n', '<Leader>Y', '"+y$', {silent = true })

-- Paste from system clipboard after the cursor
vim.keymap.set('n', '<Leader>p', '"+p', {silent = true})
-- Same, but ovewrites selection
vim.keymap.set('v', '<Leader>p', '"+p', {silent = true})

-- Delete the current line without copying it to buffer
vim.keymap.set('n', '<Leader>d', '"_dd', {silent = true})
-- Same, but deletes highlighted selection
vim.keymap.set('v', '<Leader>d', '"_d', {silent = true})

-- Change the current line without copying it
vim.keymap.set('n', '<Leader>c', '"_cc', {silent = true}) 
-- Same, but changes the highlighted selection
vim.keymap.set('v', '<Leader>c', '"_c', {silent = true}) 

vim.keymap.set('n', '<M-h>', ":vertical resize -3<CR>", { silent = true, desc = "Shrink width" })
vim.keymap.set('n', '<M-l>', ":vertical resize +3<CR>", { silent = true, desc = "Expand width" })
vim.keymap.set('n', '<M-j>', ":resize -3<CR>", { silent = true, desc = "Shrink height" })
vim.keymap.set('n', '<M-k>', ":resize +3<CR>", { silent = true, desc = "Expand height" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Equalize window sizes" })
