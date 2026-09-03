return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        arduino_language_server = {
          cmd = {
            "arduino-language-server",
            "-clangd",
            "clangd",
            "-cli",
            "arduino-cli",
            "-cli-config",
            vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
            -- CHANGE THIS to match your specific board (e.g., "arduino:avr:uno")
            "-fqbn",
            "arduino:avr:uno",
          },
          filetypes = { "arduino" },
        },
      },
    },
  },
}
