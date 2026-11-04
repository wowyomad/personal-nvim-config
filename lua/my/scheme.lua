local groups = { "Normal", "NormalFloat", "NormalNC", "SignColumn", "LineNr", "EndOfBuffer" }
for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
end
