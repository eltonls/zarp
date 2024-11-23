return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "typescript", "vue", "go" },
      auto_install = true,
      highlight = {
        enable = true
      },
    },
  },
}
