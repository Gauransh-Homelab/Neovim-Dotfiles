-- csvview.nvim: Tabular CSV/TSV viewer and editor
return {
  'hat0uma/csvview.nvim',
  ft = { 'csv', 'tsv' },
  cmd = { 'CsvViewEnable', 'CsvViewDisable', 'CsvViewToggle' },
  opts = {
    parser = { comments = { '#', '//' } },
    view = {
      display_mode = 'border', -- draws │ separators between columns
      header_lnum = 1, -- keep first row pinned as a sticky header
    },
    keymaps = {
      -- text objects for selecting fields
      textobject_field_inner = { 'if', mode = { 'o', 'x' } },
      textobject_field_outer = { 'af', mode = { 'o', 'x' } },
      -- excel-like navigation between cells
      jump_next_field_end = { '<Tab>', mode = { 'n', 'v' } },
      jump_prev_field_end = { '<S-Tab>', mode = { 'n', 'v' } },
      jump_next_row = { '<Enter>', mode = { 'n', 'v' } },
      jump_prev_row = { '<S-Enter>', mode = { 'n', 'v' } },
    },
  },
  keys = {
    { '<leader>cv', '<cmd>CsvViewToggle<cr>', desc = 'Toggle CSV [V]iew' },
  },
  config = function(_, opts)
    require('csvview').setup(opts)
    -- auto-enable when opening csv/tsv files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'csv', 'tsv' },
      callback = function(ev)
        require('csvview').enable(ev.buf)
      end,
    })
  end,
}
