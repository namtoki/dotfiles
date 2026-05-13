vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "cpp", "c", "sh", "txt", "cmake", "markdown" },
  callback = function()
    vim.b.autoformat = false
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    local ok, _ = pcall(require, "dap")
    if not ok then
      return
    end
    vim.api.nvim_set_hl(0, "goldenrod", { bg = "#daa520" })
    local sign = vim.fn.sign_define
    sign("DapStopped", { text = "▶", texthl = "", linehl = "goldenrod", numhl = "goldenrod" })
  end,
})
