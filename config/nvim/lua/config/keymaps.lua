local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")
keymap.set("n", "<C-a>", "gg<S-v>G")
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")
keymap.set("n", "<leader>w", ":<C-u>w<CR>")
keymap.set("n", "<leader>q", ":<C-u>q!<CR>")

-- Diagnostics-- Diagnostics
keymap.set("n", "<C-j>", function()
    vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>r", function()
    require("craftzdog.utils").replaceHexWithHSL()
end)
