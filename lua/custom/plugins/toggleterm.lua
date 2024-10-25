return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      open_mapping = [[<c-\>]],
      direction = 'float',
      shell = function ()
        if vim.fn.has 'win32' == 1  then
          return "pwsh"
        else
          return vim.o.shell
        end
      end
    },
  },
}
