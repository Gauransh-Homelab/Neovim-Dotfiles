-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- ================================================================
-- [[ Plugin Keymaps ]]
-- ================================================================

-- [[ Conform (Code Formatting) ]]
vim.keymap.set('', '<leader>f', function()
  require('conform').format { async = true, lsp_format = 'fallback' }
end, { desc = '[F]ormat buffer' })

-- [[ Debug (DAP) ]]
vim.keymap.set('n', '<F5>', function()
  require('dap').continue()
end, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F1>', function()
  require('dap').step_into()
end, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F2>', function()
  require('dap').step_over()
end, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F3>', function()
  require('dap').step_out()
end, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>b', function()
  require('dap').toggle_breakpoint()
end, { desc = 'Debug: Toggle [B]reakpoint' })
vim.keymap.set('n', '<leader>B', function()
  require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Debug: Set [B]reakpoint' })
vim.keymap.set('n', '<F7>', function()
  require('dapui').toggle()
end, { desc = 'Debug: See last session result.' })

-- [[ Fugitive (Git) ]]
vim.keymap.set('n', '<leader>gs', ':Git<CR>', { desc = '[G]it [S]tatus' })
vim.keymap.set('n', '<leader>gd', ':Gdiffsplit<CR>', { desc = '[G]it [D]iff' })
vim.keymap.set('n', '<leader>gc', ':Git commit<CR>', { desc = '[G]it [C]ommit' })
vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', { desc = '[G]it [B]lame' })
vim.keymap.set('n', '<leader>gl', ':Git log<CR>', { desc = '[G]it [L]og' })
vim.keymap.set('n', '<leader>gp', ':Git push<CR>', { desc = '[G]it [P]ush' })
vim.keymap.set('n', '<leader>gP', ':Git pull<CR>', { desc = '[G]it [P]ull' })
vim.keymap.set('n', '<leader>gf', ':Git fetch<CR>', { desc = '[G]it [F]etch' })
vim.keymap.set('n', '<leader>gw', ':Gwrite<CR>', { desc = '[G]it [W]rite (stage)' })
vim.keymap.set('n', '<leader>gr', ':Gread<CR>', { desc = '[G]it [R]ead (checkout)' })

-- [[ Gitsigns ]]
vim.keymap.set('n', ']c', function()
  if vim.wo.diff then
    vim.cmd.normal { ']c', bang = true }
  else
    require('gitsigns').nav_hunk 'next'
  end
end, { desc = 'Jump to next git [c]hange' })

vim.keymap.set('n', '[c', function()
  if vim.wo.diff then
    vim.cmd.normal { '[c', bang = true }
  else
    require('gitsigns').nav_hunk 'prev'
  end
end, { desc = 'Jump to previous git [c]hange' })

vim.keymap.set({ 'n', 'v' }, '<leader>hs', function()
  require('gitsigns').stage_hunk()
end, { desc = 'Git [s]tage hunk' })
vim.keymap.set({ 'n', 'v' }, '<leader>hr', function()
  require('gitsigns').reset_hunk()
end, { desc = 'Git [r]eset hunk' })
vim.keymap.set('n', '<leader>hS', function()
  require('gitsigns').stage_buffer()
end, { desc = 'Git [S]tage buffer' })
vim.keymap.set('n', '<leader>hu', function()
  require('gitsigns').undo_stage_hunk()
end, { desc = 'Git [u]ndo stage hunk' })
vim.keymap.set('n', '<leader>hR', function()
  require('gitsigns').reset_buffer()
end, { desc = 'Git [R]eset buffer' })
vim.keymap.set('n', '<leader>hp', function()
  require('gitsigns').preview_hunk()
end, { desc = 'Git [p]review hunk' })
vim.keymap.set('n', '<leader>hb', function()
  require('gitsigns').blame_line { full = false }
end, { desc = 'Git [b]lame line' })
vim.keymap.set('n', '<leader>hd', function()
  require('gitsigns').diffthis()
end, { desc = 'Git [d]iff against index' })
vim.keymap.set('n', '<leader>hD', function()
  require('gitsigns').diffthis '@'
end, { desc = 'Git [D]iff against last commit' })
vim.keymap.set('n', '<leader>tb', function()
  require('gitsigns').toggle_current_line_blame()
end, { desc = '[T]oggle git show [b]lame line' })
vim.keymap.set('n', '<leader>tD', function()
  require('gitsigns').toggle_deleted()
end, { desc = '[T]oggle git show [D]eleted' })

-- [[ Harpoon ]]
vim.keymap.set('n', '<leader>ha', function()
  require('harpoon.mark').add_file()
end, { desc = 'Harpoon [a]dd file' })
vim.keymap.set('n', '<leader>hh', function()
  require('harpoon.ui').toggle_quick_menu()
end, { desc = 'Harpoon toggle menu' })
vim.keymap.set('n', '<leader>h1', function()
  require('harpoon.ui').nav_file(1)
end, { desc = 'Harpoon file 1' })
vim.keymap.set('n', '<leader>h2', function()
  require('harpoon.ui').nav_file(2)
end, { desc = 'Harpoon file 2' })
vim.keymap.set('n', '<leader>h3', function()
  require('harpoon.ui').nav_file(3)
end, { desc = 'Harpoon file 3' })
vim.keymap.set('n', '<leader>h4', function()
  require('harpoon.ui').nav_file(4)
end, { desc = 'Harpoon file 4' })
vim.keymap.set('n', '<leader>hp', function()
  require('harpoon.ui').nav_prev()
end, { desc = 'Harpoon [p]revious' })
vim.keymap.set('n', '<leader>hn', function()
  require('harpoon.ui').nav_next()
end, { desc = 'Harpoon [n]ext' })

-- [[ Lint (Enhanced) ]]
vim.keymap.set('n', '<leader>l', function()
  require('lint').try_lint()
end, { desc = '[L]int current file' })

-- [[ LSP ]]
local lsp_attach = function(event)
  local map = function(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
  end

  map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
  map('gra', vim.lsp.buf.code_action, 'Code [A]ction', { 'n', 'x' })
  map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')
  map('gO', require('telescope.builtin').lsp_document_symbols, 'D[o]cument Symbols')
  map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace Symbols')
  map('<leader>th', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
  end, '[T]oggle Inlay [H]ints')
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = lsp_attach,
})

-- [[ Neo-tree ]]
vim.keymap.set('n', '\\', function()
  require('neo-tree.command').execute { toggle = true }
end, { desc = 'NeoTree toggle' })

-- [[ Neogen (Documentation) ]]
vim.keymap.set('n', '<leader>nf', function()
  require('neogen').generate { type = 'func' }
end, { desc = '[N]eogen [f]unction documentation' })
vim.keymap.set('n', '<leader>nc', function()
  require('neogen').generate { type = 'class' }
end, { desc = '[N]eogen [c]lass documentation' })
vim.keymap.set('n', '<leader>nt', function()
  require('neogen').generate { type = 'type' }
end, { desc = '[N]eogen [t]ype documentation' })
vim.keymap.set('n', '<leader>nF', function()
  require('neogen').generate { type = 'file' }
end, { desc = '[N]eogen [F]ile documentation' })

-- [[ Neotest ]]
vim.keymap.set('n', '<leader>tt', function()
  require('neotest').run.run()
end, { desc = '[T]est run nears[t]' })
vim.keymap.set('n', '<leader>tf', function()
  require('neotest').run.run(vim.fn.expand '%')
end, { desc = '[T]est run [f]ile' })
vim.keymap.set('n', '<leader>td', function()
  require('neotest').run.run { strategy = 'dap' }
end, { desc = '[T]est [d]ebug nearest' })
vim.keymap.set('n', '<leader>ts', function()
  require('neotest').run.stop()
end, { desc = '[T]est [s]top' })
vim.keymap.set('n', '<leader>ta', function()
  require('neotest').run.attach()
end, { desc = '[T]est [a]ttach' })
vim.keymap.set('n', '<leader>to', function()
  require('neotest').output.open { enter = true }
end, { desc = '[T]est [o]utput' })
vim.keymap.set('n', '<leader>tO', function()
  require('neotest').output_panel.toggle()
end, { desc = '[T]est [O]utput panel' })
vim.keymap.set('n', '<leader>tS', function()
  require('neotest').summary.toggle()
end, { desc = '[T]est [S]ummary' })

-- [[ Oil (File Explorer) ]]
vim.keymap.set('n', '-', function()
  require('oil').open()
end, { desc = 'Open parent directory' })
vim.keymap.set('n', '<leader>-', function()
  require('oil').open_float()
end, { desc = 'Open Oil in floating window' })

-- [[ Telescope ]]
vim.keymap.set('n', '<leader>sh', function()
  require('telescope.builtin').help_tags()
end, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', function()
  require('telescope.builtin').keymaps()
end, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', function()
  require('telescope.builtin').find_files()
end, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', function()
  require('telescope.builtin').builtin()
end, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', function()
  require('telescope.builtin').grep_string()
end, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', function()
  require('telescope.builtin').live_grep()
end, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', function()
  require('telescope.builtin').diagnostics()
end, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', function()
  require('telescope.builtin').resume()
end, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', function()
  require('telescope.builtin').oldfiles()
end, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', function()
  require('telescope.builtin').buffers()
end, { desc = '[ ] Find existing buffers' })

vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>s/', function()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })

vim.keymap.set('n', '<leader>sn', function()
  require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

-- [[ Trouble ]]
vim.keymap.set('n', '<leader>xx', function()
  require('trouble').toggle()
end, { desc = 'Trouble toggle' })
vim.keymap.set('n', '<leader>xw', function()
  require('trouble').toggle 'workspace_diagnostics'
end, { desc = 'Trouble [w]orkspace diagnostics' })
vim.keymap.set('n', '<leader>xd', function()
  require('trouble').toggle 'document_diagnostics'
end, { desc = 'Trouble [d]ocument diagnostics' })
vim.keymap.set('n', '<leader>xq', function()
  require('trouble').toggle 'quickfix'
end, { desc = 'Trouble [q]uickfix' })
vim.keymap.set('n', '<leader>xl', function()
  require('trouble').toggle 'loclist'
end, { desc = 'Trouble [l]ocation list' })
vim.keymap.set('n', 'gR', function()
  require('trouble').toggle 'lsp_references'
end, { desc = 'Trouble LSP [R]eferences' })

-- [[ UndoTree ]]
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = '[U]ndo tree toggle' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
