-- Enhanced linting for DevSecOps
return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'
    local severity_map = {
      Error = vim.diagnostic.severity.ERROR,
      Warning = vim.diagnostic.severity.WARN,
      Information = vim.diagnostic.severity.INFO,
      Suggestion = vim.diagnostic.severity.HINT,
      Hint = vim.diagnostic.severity.HINT,
    }

    local powershell_shell
    if vim.fn.executable 'pwsh' == 1 then
      powershell_shell = 'pwsh'
    elseif vim.fn.has 'win32' == 1 then
      powershell_shell = 'powershell.exe'
    else
      powershell_shell = 'pwsh'
    end

    -- Run Microsoft's static analyzer module (Install-Module PSScriptAnalyzer from PowerShell if missing)
    lint.linters.psscriptanalyzer = {
      cmd = powershell_shell,
      stdin = false,
      append_fname = false,
      ignore_exitcode = true,
      args = function()
        local filepath = vim.api.nvim_buf_get_name(0)
        if filepath == '' then
          return {
            '-NoLogo',
            '-NoProfile',
            '-Command',
            'ConvertTo-Json @()',
          }
        end
        local absolute_path = vim.fn.fnamemodify(filepath, ':p')
        local escaped_path = absolute_path:gsub("'", "''")
        local command = ([[& { param($Path) Invoke-ScriptAnalyzer -Path $Path | ConvertTo-Json -Compress -Depth 4 } -Path '%s']]):format(escaped_path)
        return {
          '-NoLogo',
          '-NoProfile',
          '-Command',
          command,
        }
      end,
      parser = function(output)
        if not output or output == '' then
          return {}
        end

        local ok, decoded = pcall(vim.json.decode, output)
        if not ok or not decoded then
          return {}
        end

        if decoded.RuleName ~= nil then
          decoded = { decoded }
        end

        if type(decoded) ~= 'table' then
          return {}
        end

        local diagnostics = {}
        for _, item in ipairs(decoded) do
          if type(item) == 'table' then
            local line = (item.Line or 1) - 1
            local col = (item.Column or 1) - 1
            table.insert(diagnostics, {
              lnum = line >= 0 and line or 0,
              col = col >= 0 and col or 0,
              severity = severity_map[item.Severity] or vim.diagnostic.severity.WARN,
              source = 'PSScriptAnalyzer',
              message = item.Message or item.RuleName or 'PSScriptAnalyzer issue',
              code = item.RuleName,
            })
          end
        end

        return diagnostics
      end,
    }

    lint.linters_by_ft = {
      python = { 'flake8', 'mypy' },
      go = { 'golangcilint' },
      sh = { 'shellcheck' },
      bash = { 'shellcheck' },
      yaml = { 'yamllint' },
      dockerfile = { 'hadolint' },
      terraform = { 'tflint' },
      markdown = { 'markdownlint' },
      ps1 = { 'psscriptanalyzer' },
      psm1 = { 'psscriptanalyzer' },
      psd1 = { 'psscriptanalyzer' },
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
