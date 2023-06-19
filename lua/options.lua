local opt = vim.opt
opt.termguicolors = true
opt.errorbells = false
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.number = true
opt.relativenumber = true
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("$HOME/.vim/undodir")
opt.undofile = true
opt.backspace = { "indent", "eol", "start" }
opt.hlsearch = false
opt.scrolloff = 8
opt.wrap = false
opt.incsearch = true
opt.encoding = "utf8"
opt.tgc = true

vim.g.markdown_fenced_languages = {'html', 'python', 'ruby', 'vim'}
