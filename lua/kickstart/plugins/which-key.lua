-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `opts` key (recommended), the configuration runs
-- after the plugin has been loaded as `require(MODULE).setup(opts)`.

return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.o.timeoutlen
      delay = 0,
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        -- Search group
        { '<leader>s', group = '[S]earch' },
        { '<leader>sh', desc = '[S]earch [H]elp' },
        { '<leader>sk', desc = '[S]earch [K]eymaps' },
        { '<leader>sf', desc = '[S]earch [F]iles' },
        { '<leader>ss', desc = '[S]earch [S]elect Telescope' },
        { '<leader>sw', desc = '[S]earch current [W]ord' },
        { '<leader>sg', desc = '[S]earch by [G]rep' },
        { '<leader>sd', desc = '[S]earch [D]iagnostics' },
        { '<leader>sr', desc = '[S]earch [R]esume' },
        { '<leader>s.', desc = '[S]earch Recent Files' },
        { '<leader>s/', desc = '[S]earch [/] in Open Files' },
        { '<leader>sn', desc = '[S]earch [N]eovim files' },

        -- Toggle group
        { '<leader>t', group = '[T]oggle' },
        { '<leader>tb', desc = '[T]oggle git show [b]lame line' },
        { '<leader>tD', desc = '[T]oggle git show [D]eleted' },
        { '<leader>th', desc = '[T]oggle Inlay [H]ints' },

        -- Git groups
        { '<leader>g', group = '[G]it' },
        { '<leader>gs', desc = '[G]it [S]tatus' },
        { '<leader>gd', desc = '[G]it [D]iff' },
        { '<leader>gc', desc = '[G]it [C]ommit' },
        { '<leader>gb', desc = '[G]it [B]lame' },
        { '<leader>gl', desc = '[G]it [L]og' },
        { '<leader>gp', desc = '[G]it [P]ush' },
        { '<leader>gP', desc = '[G]it [P]ull' },
        { '<leader>gf', desc = '[G]it [F]etch' },
        { '<leader>gw', desc = '[G]it [W]rite (stage)' },
        { '<leader>gr', desc = '[G]it [R]ead (checkout)' },

        -- Git hunk group
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        { '<leader>hs', desc = 'Git [s]tage hunk', mode = { 'n', 'v' } },
        { '<leader>hr', desc = 'Git [r]eset hunk', mode = { 'n', 'v' } },
        { '<leader>hS', desc = 'Git [S]tage buffer' },
        { '<leader>hu', desc = 'Git [u]ndo stage hunk' },
        { '<leader>hR', desc = 'Git [R]eset buffer' },
        { '<leader>hp', desc = 'Git [p]review hunk' },
        { '<leader>hb', desc = 'Git [b]lame line' },
        { '<leader>hd', desc = 'Git [d]iff against index' },
        { '<leader>hD', desc = 'Git [D]iff against last commit' },

        -- Harpoon group
        { '<leader>ha', desc = 'Harpoon [a]dd file' },
        { '<leader>hh', desc = 'Harpoon toggle menu' },
        { '<leader>h1', desc = 'Harpoon file 1' },
        { '<leader>h2', desc = 'Harpoon file 2' },
        { '<leader>h3', desc = 'Harpoon file 3' },
        { '<leader>h4', desc = 'Harpoon file 4' },
        { '<leader>hp', desc = 'Harpoon [p]revious' },
        { '<leader>hn', desc = 'Harpoon [n]ext' },

        -- Debug group
        { '<leader>b', desc = 'Debug: Toggle [B]reakpoint' },
        { '<leader>B', desc = 'Debug: Set [B]reakpoint' },

        -- Neogen group
        { '<leader>n', group = '[N]eogen' },
        { '<leader>nf', desc = '[N]eogen [f]unction documentation' },
        { '<leader>nc', desc = '[N]eogen [c]lass documentation' },
        { '<leader>nt', desc = '[N]eogen [t]ype documentation' },
        { '<leader>nF', desc = '[N]eogen [F]ile documentation' },

        -- Obsidian group
        { '<leader>o', group = '[O]bsidian' },
        { '<leader>on', desc = '[O]bsidian [N]ew note' },
        { '<leader>oo', desc = '[O]bsidian [O]pen note' },
        { '<leader>os', desc = '[O]bsidian [S]earch notes' },
        { '<leader>oq', desc = '[O]bsidian [Q]uick switch' },
        { '<leader>od', desc = '[O]bsidian to[D]ay note' },
        { '<leader>oy', desc = '[O]bsidian [Y]esterday note' },
        { '<leader>ob', desc = '[O]bsidian [B]acklinks' },
        { '<leader>ol', desc = '[O]bsidian [L]inks' },
        { '<leader>ot', desc = '[O]bsidian [T]emplate' },
        { '<leader>op', desc = '[O]bsidian [P]aste image' },
        { '<leader>or', desc = '[O]bsidian [R]ename note' },

        -- Trouble group
        { '<leader>x', group = 'Trouble' },
        { '<leader>xx', desc = 'Trouble toggle' },
        { '<leader>xw', desc = 'Trouble [w]orkspace diagnostics' },
        { '<leader>xd', desc = 'Trouble [d]ocument diagnostics' },
        { '<leader>xq', desc = 'Trouble [q]uickfix' },
        { '<leader>xl', desc = 'Trouble [l]ocation list' },

        -- Markdown group
        { '<leader>m', group = '[M]arkdown' },
        { '<leader>mp', desc = 'Markdown Preview' },
        { '<leader>ms', desc = 'Markdown Preview Stop' },
        { '<leader>mt', desc = 'Markdown Preview Toggle' },

        -- Misc single keys
        { '<leader>f', desc = '[F]ormat buffer' },
        { '<leader>l', desc = '[L]int current file' },
        { '<leader>q', desc = 'Open diagnostic [Q]uickfix list' },
        { '<leader>u', desc = '[U]ndo tree toggle' },
        { '<leader>-', desc = 'Open Oil in floating window' },
        { '<leader><leader>', desc = '[ ] Find existing buffers' },
        { '<leader>/', desc = '[/] Fuzzily search in current buffer' },

        -- Oil
        { '-', desc = 'Open parent directory' },

        -- Git navigation
        { ']c', desc = 'Jump to next git [c]hange' },
        { '[c', desc = 'Jump to previous git [c]hange' },

        -- LSP gr- mappings
        { 'gr', group = 'LSP [G]oto/[R]efactor' },
        { 'grn', desc = 'LSP: [R]e[n]ame' },
        { 'gra', desc = 'LSP: Code [A]ction' },
        { 'grr', desc = 'LSP: [G]oto [R]eferences' },
        { 'gri', desc = 'LSP: [G]oto [I]mplementation' },
        { 'grD', desc = 'LSP: [G]oto [D]eclaration' },
        { 'grd', desc = 'LSP: [G]oto [D]efinition' },
        { 'grt', desc = 'LSP: [G]oto [T]ype Definition' },

        -- Other LSP mappings
        { 'gO', desc = 'LSP: D[o]cument Symbols' },
        { 'gW', desc = 'LSP: [W]orkspace Symbols' },
        { 'gR', desc = 'Trouble LSP [R]eferences' },

        -- Function keys (Debug)
        { '<F1>', desc = 'Debug: Step Into' },
        { '<F2>', desc = 'Debug: Step Over' },
        { '<F3>', desc = 'Debug: Step Out' },
        { '<F5>', desc = 'Debug: Start/Continue' },
        { '<F7>', desc = 'Debug: See last session result' },

        -- Window navigation
        { '<C-h>', desc = 'Move focus to the left window' },
        { '<C-l>', desc = 'Move focus to the right window' },
        { '<C-j>', desc = 'Move focus to the lower window' },
        { '<C-k>', desc = 'Move focus to the upper window' },

        -- Copilot (Insert mode)
        { '<C-J>', desc = 'Copilot Accept', mode = 'i' },
        { '<C-]>', desc = 'Copilot Dismiss', mode = 'i' },
        { '<C-\\>', desc = 'Copilot Next', mode = 'i' },
        { '<C-[>', desc = 'Copilot Previous', mode = 'i' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
