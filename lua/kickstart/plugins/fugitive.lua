-- Fugitive: Git wrapper
return {
  'tpope/fugitive',
  config = function()
    -- Git keymaps
    vim.keymap.set('n', '<leader>gs', '<cmd>Git<cr>', { desc = '[G]it [S]tatus' })
    vim.keymap.set('n', '<leader>gd', '<cmd>Gdiffsplit<cr>', { desc = '[G]it [D]iff' })
    vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<cr>', { desc = '[G]it [C]ommit' })
    vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<cr>', { desc = '[G]it [B]lame' })
    vim.keymap.set('n', '<leader>gl', '<cmd>Git log<cr>', { desc = '[G]it [L]og' })
    vim.keymap.set('n', '<leader>gp', '<cmd>Git push<cr>', { desc = '[G]it [P]ush' })
    vim.keymap.set('n', '<leader>gP', '<cmd>Git pull<cr>', { desc = '[G]it [P]ull' })
    vim.keymap.set('n', '<leader>gf', '<cmd>Git fetch<cr>', { desc = '[G]it [F]etch' })
    vim.keymap.set('n', '<leader>gw', '<cmd>Gwrite<cr>', { desc = '[G]it [W]rite (stage)' })
    vim.keymap.set('n', '<leader>gr', '<cmd>Gread<cr>', { desc = '[G]it [R]ead (checkout)' })
  end,
}