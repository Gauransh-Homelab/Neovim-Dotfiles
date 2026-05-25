-- Neogen: Documentation generator
return {
  'danymat/neogen',
  -- Neogen now requires only tree-sitter parsers on the system, not the
  -- archived nvim-treesitter plugin. nvim 0.12's built-in treesitter provides
  -- parsers; install additional ones via the tree-sitter CLI if needed.
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