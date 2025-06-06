-- Neogen: Documentation generator
return {
  'danymat/neogen',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  opts = {
    snippet_engine = 'nvim',
    languages = {
      python = {
        template = {
          annotation_convention = 'google_docstrings',
        },
      },
      go = {
        template = {
          annotation_convention = 'godoc',
        },
      },
      bash = {
        template = {
          annotation_convention = 'bash',
        },
      },
    },
  },
  config = function(_, opts)
    require('neogen').setup(opts)
    
    -- Keymaps for documentation generation
    vim.keymap.set('n', '<leader>nf', function()
      require('neogen').generate { type = 'func' }
    end, { desc = '[N]eogen [F]unction' })
    
    vim.keymap.set('n', '<leader>nc', function()
      require('neogen').generate { type = 'class' }
    end, { desc = '[N]eogen [C]lass' })
    
    vim.keymap.set('n', '<leader>nt', function()
      require('neogen').generate { type = 'type' }
    end, { desc = '[N]eogen [T]ype' })
    
    vim.keymap.set('n', '<leader>nF', function()
      require('neogen').generate { type = 'file' }
    end, { desc = '[N]eogen [F]ile' })
  end,
}