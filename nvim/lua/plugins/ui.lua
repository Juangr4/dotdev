return {
  {
    'akinsho/bufferline.nvim',
    dependencies = {
      'moll/vim-bbye',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('bufferline').setup {
        options = {
          mode = 'buffers', -- set to "tabs" to only show tabpages instead
          themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
          numbers = 'none', -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
          close_command = 'Bdelete! %d', -- can be a string | function, see "Mouse actions"
          buffer_close_icon = '✗',
          close_icon = '✗',
          path_components = 1, -- Show only the file name without the directory
          modified_icon = '●',
          left_trunc_marker = '',
          right_trunc_marker = '',
          max_name_length = 30,
          max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
          tab_size = 21,
          diagnostics = false,
          diagnostics_update_in_insert = false,
          color_icons = true,
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
          separator_style = { '│', '│' }, -- | "thick" | "thin" | { 'any', 'any' },
          enforce_regular_tabs = true,
          always_show_bufferline = true,
          show_tab_indicators = false,
          indicator = {
            -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'none', -- Options: 'icon', 'underline', 'none'
          },
          icon_pinned = '󰐃',
          minimum_padding = 1,
          maximum_padding = 5,
          maximum_length = 15,
          sort_by = 'insert_at_end',
        },
        highlights = {
          separator = {
            fg = '#434C5E',
          },
          buffer_selected = {
            bold = true,
            italic = false,
          },
          -- separator_selected = {},
          -- tab_selected = {},
          -- background = {},
          -- indicator_selected = {},
          -- fill = {},
        },
      }
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      local mode = {
        'mode',
        fmt = function(str)
          return ' ' .. str
          -- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
        end,
      }

      local filename = {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
      }

      local hide_in_width = function()
        return vim.fn.winwidth(0) > 100
      end

      local diagnostics = {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        sections = { 'error', 'warn' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
        colored = false,
        update_in_insert = false,
        always_visible = false,
        cond = hide_in_width,
      }

      local diff = {
        'diff',
        colored = false,
        symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
        cond = hide_in_width,
      }

      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'nord', -- Set theme based on environment variable
          -- Some useful glyphs:
          -- https://www.nerdfonts.com/cheat-sheet
          --        
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          disabled_filetypes = { 'alpha', 'neo-tree' },
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { mode },
          lualine_b = { 'branch' },
          lualine_c = { filename },
          lualine_x = { diagnostics, diff, { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width } },
          lualine_y = { 'location' },
          lualine_z = { 'progress' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { { 'location', padding = 0 } },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = { 'fugitive' },
      }
    end,
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    opts = function()
      local logo = [[
╔══════════════════════════════════════════════════════════════════════════════════╗
║                                                                                  ║
║  ██╗    ██╗      ██████╗ ██╗   ██╗███████╗     ██████╗ ██████╗ ██████╗ ███████╗  ║
║  ██║    ██║     ██╔═══██╗██║   ██║██╔════╝    ██╔════╝██╔═══██╗██╔══██╗██╔════╝  ║
║  ██║    ██║     ██║   ██║██║   ██║█████╗      ██║     ██║   ██║██║  ██║█████╗    ║
║  ██║    ██║     ██║   ██║╚██╗ ██╔╝██╔══╝      ██║     ██║   ██║██║  ██║██╔══╝    ║
║  ██║    ███████╗╚██████╔╝ ╚████╔╝ ███████╗    ╚██████╗╚██████╔╝██████╔╝███████╗  ║
║  ╚═╝    ╚══════╝ ╚═════╝   ╚═══╝  ╚══════╝     ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝  ║
║                                                                                  ║
╚══════════════════════════════════════════════════════════════════════════════════╝
    ]]

      logo = string.rep('\n', 8) .. logo .. '\n\n'

      local opts = {
        theme = 'doom',
        hide = {
          statusline = false,
        },
        config = {
          header = vim.split(logo, '\n'),
        -- stylua: ignore
        center = {
          { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
          { action = function() vim.fn.system('nvim --headless /mnt/c/Users/Juangr4/Documents/Vaults/personal') end, desc = " Obsidian folder", icon = "A ", key = "o" },
          { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
        },
          footer = function()
            local stats = require('lazy').stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
        button.key_format = '  %s'
      end

      -- open dashboard after closing lazy
      if vim.o.filetype == 'lazy' then
        vim.api.nvim_create_autocmd('WinClosed', {
          pattern = tostring(vim.api.nvim_get_current_win()),
          once = true,
          callback = function()
            vim.schedule(function()
              vim.api.nvim_exec_autocmds('UIEnter', { group = 'dashboard' })
            end)
          end,
        })
      end

      return opts
    end,
  },
}
