-- LazyVim uses markdownlint-cli2 via the markdown Extra + nvim-lint.
-- Rule tweaks live in .markdownlint-cli2.yaml (cli2 ignores --disable flags).
return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          prepend_args = {
            "--config",
            vim.fn.stdpath("config") .. "/.markdownlint-cli2.yaml",
            "--",
          },
        },
      },
      -- To disable markdown linting entirely instead, use:
      -- linters_by_ft = { markdown = {} },
    },
  },
}
