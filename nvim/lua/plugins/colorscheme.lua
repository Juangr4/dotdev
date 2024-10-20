return {
  {
    'catppuccin/nvim',
    enabled = false,
    lazy = false,
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
      }
      vim.cmd.colorscheme = 'catppuccin'
    end,
  },
}
