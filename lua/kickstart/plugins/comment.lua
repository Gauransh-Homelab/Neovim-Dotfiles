-- Comment.nvim - Smart and powerful comment plugin for neovim
-- https://github.com/numToStr/Comment.nvim

return {
  'numToStr/Comment.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring', -- For JSX/TSX support
  },
  config = function()
    -- Skip the legacy nvim-treesitter module registration (that plugin is gone).
    vim.g.skip_ts_context_commentstring_module = true

    -- Disable the CursorHold autocmd that recalculates commentstring — it errors
    -- ("language_tree is nil") on buffers without a treesitter parser. We get
    -- context-aware commenting on-demand via Comment.nvim's pre_hook below.
    require('ts_context_commentstring').setup { enable_autocmd = false }

    local comment = require('Comment')
    local ts_context_commentstring = require('ts_context_commentstring.integrations.comment_nvim')

    -- Guarded pre_hook: on Neovim 0.11+, vim.treesitter.get_parser() returns nil
    -- (instead of erroring) for buffers without a parser, which makes the upstream
    -- hook crash with "attempt to index local 'language_tree' (a nil value)" and
    -- surfaces as "[Comment.nvim] nil". pcall it and fall back (return nil) so
    -- Comment.nvim uses the buffer's native 'commentstring' for those filetypes
    -- (hcl/terragrunt, python, json, yaml, sh, …). Context-aware commenting still
    -- works wherever a parser exists (JSX/TSX, etc.).
    local ts_pre_hook = ts_context_commentstring.create_pre_hook()
    local function safe_pre_hook(ctx)
      local ok, result = pcall(ts_pre_hook, ctx)
      if ok then
        return result
      end
    end

    -- Comment.nvim's own treesitter-based commentstring calc (Comment/ft.lua) has
    -- the SAME Neovim 0.11+ regression: pcall(vim.treesitter.get_parser, …) now
    -- SUCCEEDS with a nil parser instead of erroring, so the upstream `if not ok`
    -- guard is skipped and it crashes indexing the nil tree ("[Comment.nvim] nil").
    -- Comment.nvim is unmaintained, so patch ft.calculate to also bail out when the
    -- parser is nil, falling back to the filetype's native commentstring.
    local ft = require('Comment.ft')
    local orig_ft_calculate = ft.calculate
    rawset(ft, 'calculate', function(ctx)
      local ok, parser = pcall(vim.treesitter.get_parser, vim.api.nvim_get_current_buf())
      if not ok or not parser then
        return ft.get(vim.bo.filetype, ctx.ctype)
      end
      return orig_ft_calculate(ctx)
    end)

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

      -- Pre-hook for ts_context_commentstring integration (guarded; see above)
      pre_hook = safe_pre_hook,
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