return {
  'github/copilot.vim',
  event = 'InsertEnter',
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_tab_fallback = ""
    
    local keymap = vim.keymap.set
    keymap("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false
    })
    keymap("i", "<C-]>", "<Plug>(copilot-dismiss)")
    keymap("i", "<C-\\>", "<Plug>(copilot-next)")
    keymap("i", "<C-[>", "<Plug>(copilot-previous)")
  end,
}