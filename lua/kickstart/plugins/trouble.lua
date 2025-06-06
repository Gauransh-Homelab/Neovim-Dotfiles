-- Trouble: Diagnostics and quickfix UI
return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    position = 'bottom',
    height = 10,
    width = 50,
    icons = true,
    mode = 'workspace_diagnostics',
    severity = nil,
    fold_open = '',
    fold_closed = '',
    group = true,
    padding = true,
    cycle_results = true,
    action_keys = {
      close = 'q',
      cancel = '<esc>',
      refresh = 'r',
      jump = { '<cr>', '<tab>', '<2-leftmouse>' },
      open_split = { '<c-x>' },
      open_vsplit = { '<c-v>' },
      open_tab = { '<c-t>' },
      jump_close = { 'o' },
      toggle_mode = 'm',
      switch_severity = 's',
      toggle_preview = 'P',
      hover = 'K',
      preview = 'p',
      open_code_href = 'c',
      close_folds = { 'zM', 'zm' },
      open_folds = { 'zR', 'zr' },
      toggle_fold = { 'zA', 'za' },
      previous = 'k',
      next = 'j',
      help = '?',
    },
    multiline = true,
    indent_lines = true,
    win_config = { border = 'single' },
    auto_open = false,
    auto_close = false,
    auto_preview = true,
    auto_fold = false,
    auto_jump = { 'lsp_definitions' },
    include_declaration = {
      'lsp_references',
      'lsp_implementations',
      'lsp_definitions',
    },
    signs = {
      error = '',
      warning = '',
      hint = '',
      information = '',
      other = '',
    },
    use_diagnostic_signs = false,
  },
  config = function(_, opts)
    require('trouble').setup(opts)
    
    -- Keymaps
    vim.keymap.set('n', '<leader>xx', function()
      require('trouble').toggle()
    end, { desc = 'Toggle Trouble' })

    vim.keymap.set('n', '<leader>xw', function()
      require('trouble').toggle 'workspace_diagnostics'
    end, { desc = 'Trouble workspace diagnostics' })

    vim.keymap.set('n', '<leader>xd', function()
      require('trouble').toggle 'document_diagnostics'
    end, { desc = 'Trouble document diagnostics' })

    vim.keymap.set('n', '<leader>xq', function()
      require('trouble').toggle 'quickfix'
    end, { desc = 'Trouble quickfix' })

    vim.keymap.set('n', '<leader>xl', function()
      require('trouble').toggle 'loclist'
    end, { desc = 'Trouble location list' })

    vim.keymap.set('n', 'gR', function()
      require('trouble').toggle 'lsp_references'
    end, { desc = 'Trouble LSP references' })
  end,
}