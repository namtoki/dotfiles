vim.g.mapleader = " "
vim.g.python_host_prog = "/home/tanamura/.pyenv/shims/python"

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.title = true
vim.g.autoformat = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
if vim.fn.has("nvim-0.8") == 1 then
  vim.opt.cmdheight = 0
end
vim.opt.laststatus = 2 -- 3
vim.opt.expandtab = true
-- vim.opt.scrolloff = 10
-- vim.opt.shell = "zsh"
-- vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
-- vim.opt.inccommand = "split"
vim.opt.ignorecase = true
-- vim.opt.smarttab = true
-- vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.backspace = { "start", "eol", "indent" }
-- vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
-- vim.opt.wildignore:append({ "*/node_modules/*" })
-- vim.opt.splitbelow = true -- Put new windows below current
-- vim.opt.splitright = true -- Put new windows right of current
-- vim.opt.splitkeep = "cursor"
-- vim.opt.mouse = ""
-- vim.opt.ambiwidth = "single"
vim.opt.termguicolors = true
vim.opt.winblend = 20
vim.opt.pumblend = 20
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.whichwrap = "b,s,[,],<,>"
vim.opt.nrformats = "bin,hex"
vim.opt.formatoptions:remove("t")
vim.opt.formatoptions:append("mM")
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
vim.opt.wildmenu = true
vim.opt.hidden = true
