return {
  {
    'saghen/blink.cmp',
    event = { 'LspAttach' },
    -- use a release tag to download pre-built binaries
    version = 'v0.*',
    opts = {
      highlight = {
        use_nvim_cmp_as_default = true,
      },
      nerd_font_variant = 'normal',

      -- experimental auto-brackets support
      accept = { auto_brackets = { enabled = true } },
      kind_icons = {
        Text = '󰉿',
        Method = 'm',
        Function = '󰊕',
        Constructor = '',

        Field = '',
        Variable = '󰆧',
        Property = '',

        Class = '󰌗',
        Interface = '',
        Struct = '',
        Module = '',

        Unit = '',
        Value = '󰎠',
        Enum = '',
        EnumMember = '',

        Keyword = '󰌋',
        Constant = '󰇽',

        Snippet = '',
        Color = '󰏘',
        File = '󰈙',
        Reference = '',
        Folder = '󰉋',
        Event = '',
        Operator = '󰆕',
        TypeParameter = '󰊄',
      },
    },
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
  },
}
