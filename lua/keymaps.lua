-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Buffer movement
vim.keymap.set('n', '<leader>`', '<C-6>', { desc = 'Go to previous (alternate) buffer' })

-- Yank Buffer
vim.keymap.set('n', '<leader>yy', ':%y"+<CR>', { desc = 'Yank entire file'})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1 }
end, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1 }
end, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>ce', vim.diagnostic.open_float, { desc = 'Show [C]ode diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>cq', vim.diagnostic.setloclist, { desc = 'Open [C]ode diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ LSP Keymapping ]]
vim.keymap.set('n', '<leader>Li', ':LspInfo<CR>', { desc = '[L]sp [I]nfo' })
vim.keymap.set('n', '<leader>Lr', ':LspRestart<CR>', { desc = '[L]sp [R]estart' })
vim.keymap.set('n', '<leader>Ls', ':LspStart<CR>', { desc = '[L]sp [S]tart' })
vim.keymap.set('n', '<leader>LS', ':LspStop<CR>', { desc = '[L]sp [S]top' })
vim.keymap.set('n', '<leader>Ll', ':LspLog<CR>', { desc = '[L]sp [L]og' })

-- [[ lazy.nvim ]]
-- NOTE: This is technically misplaced since it is not pure vim, rather relying on lazy.nvim being installed
vim.keymap.set('n', '<leader>l', ':Lazy<CR>', { desc = 'Toggle Lazy' })

-- [[ Toggle Keymaps ]]

-- Diagnostics

-- Creates autocommand for showing line diagnostics automatically in hover window
local create_hoverdiag_au = function()
  vim.o.updatetime = 500
  vim.api.nvim_create_autocmd({ 'cursorhold', 'cursorholdi' }, {
    group = vim.api.nvim_create_augroup('float_diagnostic', { clear = true }),
    callback = function()
      vim.diagnostic.open_float(nil, { focus = false })
    end,
  })
end

-- State that handles toggling of diagnostics
local diagnostics_active = true
create_hoverdiag_au()

-- Inverts `diagnostics_active` and handles hover diagnostics autocommand
local toggle_diagnostics = function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
    create_hoverdiag_au()
  else
    vim.diagnostic.hide()
    vim.api.nvim_del_augroup_by_name 'float_diagnostic'
  end
  print('Toggled diagnostics to', diagnostics_active)
end

vim.keymap.set('n', '<leader>ud', toggle_diagnostics, { desc = 'Toggle [D]iagnostics' })

-- Toggles conceallevel between 0 and 2
vim.keymap.set('n', '<leader>uc', function()
  if vim.o.conceallevel ~= 0 then
    vim.o.conceallevel = 0
  else
    vim.o.conceallevel = 2
  end
  print('Toggled conceal level to', vim.o.conceallevel)
end, { desc = 'Toggle [C]onceal' })

-- Toggles wrap and linebreak based on current value of vim.o.wrap
vim.keymap.set('n', '<leader>uw', function()
  if vim.o.wrap then
    vim.o.wrap = false
    vim.o.linebreak = false
  else
    vim.o.wrap = true
    vim.o.linebreak = true
  end
  print('Toggled text wrapping to', vim.o.wrap)
end, { desc = 'Toggle [W]rap' })

-- vim: ts=2 sts=2 sw=2 et
