-- Enhanced linting for DevSecOps
return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      python = { 'flake8', 'mypy' },
      go = { 'golangcilint' },
      sh = { 'shellcheck' },
      bash = { 'shellcheck' },
      yaml = { 'yamllint' },
      dockerfile = { 'hadolint' },
      terraform = { 'tflint' },
      markdown = { 'markdownlint' },
    }

    -- Custom linter configurations
    lint.linters.yamllint.args = {
      '-d',
      '{extends: default, rules: {line-length: {max: 120}, comments: disable}}',
      '--format',
      'parsable',
      '-',
    }

    lint.linters.flake8.args = {
      '--max-line-length=88',
      '--extend-ignore=E203,W503',
      '--format=%(path)s:%(row)d:%(col)d: %(code)s %(text)s',
      '--stdin-display-name',
      function()
        return vim.api.nvim_buf_get_name(0)
      end,
      '-',
    }

    -- Auto-lint on save and text changes
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

  end,
}