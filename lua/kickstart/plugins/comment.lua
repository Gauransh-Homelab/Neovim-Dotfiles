-- Comment.nvim - Smart and powerful comment plugin for neovim
-- https://github.com/numToStr/Comment.nvim

return {
  'numToStr/Comment.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring', -- For JSX/TSX support
  },
  config = function()
    local comment = require('Comment')
    local ts_context_commentstring = require('ts_context_commentstring.integrations.comment_nvim')

    comment.setup {
      -- Add a space between comment and the line
      padding = true,

      -- Whether the cursor should stay at its position
      sticky = true,

      -- Lines to be ignored while (un)comment
      ignore = '^$',

      -- LHS of toggle mappings in NORMAL mode
      toggler = {
        -- Line-comment toggle keymap
        line = 'gcc',
        -- Block-comment toggle keymap
        block = 'gbc',
      },

      -- LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        -- Line-comment keymap
        line = 'gc',
        -- Block-comment keymap
        block = 'gb',
      },

      -- LHS of extra mappings
      extra = {
        -- Add comment on the line above
        above = 'gcO',
        -- Add comment on the line below
        below = 'gco',
        -- Add comment at the end of line
        eol = 'gcA',
      },

      -- Enable keybindings
      mappings = {
        -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        -- Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
      },

      -- Pre-hook for ts_context_commentstring integration
      pre_hook = ts_context_commentstring.create_pre_hook(),
    }

    -- Additional keybindings for VS Code-like experience
    local api = require('Comment.api')
    local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)

    -- Toggle comment with Ctrl+/ in normal mode
    vim.keymap.set('n', '<C-/>', function()
      api.toggle.linewise.current()
    end, { desc = 'Toggle comment' })

    -- Toggle comment with Ctrl+/ in visual mode
    vim.keymap.set('x', '<C-/>', function()
      vim.api.nvim_feedkeys(esc, 'nx', false)
      api.toggle.linewise(vim.fn.visualmode())
    end, { desc = 'Toggle comment' })

    -- Some terminals send Ctrl+/ as Ctrl+_ so we map both
    vim.keymap.set('n', '<C-_>', function()
      api.toggle.linewise.current()
    end, { desc = 'Toggle comment' })

    vim.keymap.set('x', '<C-_>', function()
      vim.api.nvim_feedkeys(esc, 'nx', false)
      api.toggle.linewise(vim.fn.visualmode())
    end, { desc = 'Toggle comment' })

    -- Alternative keybindings similar to VS Code's Ctrl+K Ctrl+C and Ctrl+K Ctrl+U
    vim.keymap.set('n', '<leader>/', function()
      api.toggle.linewise.current()
    end, { desc = 'Toggle comment' })

    vim.keymap.set('x', '<leader>/', function()
      vim.api.nvim_feedkeys(esc, 'nx', false)
      api.toggle.linewise(vim.fn.visualmode())
    end, { desc = 'Toggle comment (visual)' })
  end,
}