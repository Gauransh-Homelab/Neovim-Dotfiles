return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    local dashboard = require 'dashboard'

    local function get_ascii_art()
      return {
        '     █████╗ ██████╗ ██╗  ██╗██╗  ██╗ █████╗ ██╗   ██╗ █████╗ ',
        '    ██╔══██╗██╔══██╗██║ ██╔╝██║  ██║██╔══██╗╚██╗ ██╔╝██╔══██╗',
        '    ███████║██████╔╝█████╔╝ ███████║███████║ ╚████╔╝ ███████║',
        '    ██╔══██║██╔══██╗██╔═██╗ ██╔══██║██╔══██║  ╚██╔╝  ██╔══██║',
        '    ██║  ██║██║  ██║██║  ██╗██║  ██║██║  ██║   ██║   ██║  ██║',
        '    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝',
        '',
        '',
      }
    end

    dashboard.setup {
      theme = 'hyper',
      config = {
        header = get_ascii_art(),
        shortcut = {
          {
            icon = '󰊳 ',
            desc = 'Update',
            group = '@property',
            action = 'Lazy update',
            key = 'u',
          },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            icon = ' ',
            desc = 'Apps',
            group = 'DiagnosticHint',
            action = 'Telescope find_files',
            key = 'a',
          },
          {
            icon = ' ',
            desc = 'dotfiles',
            group = 'Number',
            action = 'Telescope find_files cwd=~/.config',
            key = 'd',
          },
        },
        project = { enable = false },
        mru = { limit = 10 },
        footer = { '' },
      },
    }
  end,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
