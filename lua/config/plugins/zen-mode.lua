return {
    "folke/zen-mode.nvim",
  cmd = "ZenMode",
  keys = {
    { "<leader>zz", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
  },
  opts = {
    window = {
      backdrop = 0.95,
      width = 120, -- Set the column width of the centered text
      options = {
        signcolumn = "no",
        number = true,
        relativenumber = true,
      },
    },
  },
}
