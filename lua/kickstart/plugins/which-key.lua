-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end

return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      local wk = require 'which-key'
      wk.setup()

      -- Document existing key chains
      wk.add {
        {

          { '<leader>L', group = '[L]SP' },
          { '<leader>L_', hidden = true },
          { '<leader>c', group = '[C]ode' },
          { '<leader>c_', hidden = true },
          { '<leader>d', group = '[D]ocument' },
          { '<leader>d_', hidden = true },
          { '<leader>s', group = '[S]earch' },
          { '<leader>s_', hidden = true },
          { '<leader>u', group = '[U]I' },
          { '<leader>u_', hidden = true },
          { '<leader>w', group = '[W]orkspace' },
          { '<leader>w_', hidden = true },
          { '<leader>x', group = '[x] Trouble' },
          { '<leader>x_', hidden = true },
          { '<leader>z', group = '[Z] Folds' },
          { '<leader>z_', hidden = true },
        },
        -- visual mode
        {
          mode = { 'v' }, -- NORMAL and VISUAL mode
          { '<leader>h', group = 'Git [H]unk' },
          { '<leader>h_', hidden = true },
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
