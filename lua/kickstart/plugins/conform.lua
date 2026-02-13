return {
  { -- Autoformat
    'stevearc/conform.nvim',
    cmd = { 'ConformInfo' },
    opts = {
      notify_on_error = false,
      format_on_save = false,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- DevSecOps formatters
        python = { 'isort', 'black' },
        go = { 'gofumpt' },
        sh = { 'shfmt' },
        bash = { 'shfmt' },
        yaml = { 'prettier' },
        json = { 'prettier' },
        markdown = { 'prettier' },
        terraform = { 'terraform_fmt' },
        dockerfile = { 'prettier' },
        -- Web technologies
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        html = { 'prettier' },
        css = { 'prettier' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
