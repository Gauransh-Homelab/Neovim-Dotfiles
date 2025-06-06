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
}