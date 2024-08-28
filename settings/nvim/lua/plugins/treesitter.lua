-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "javascript",
      "typescript",
      "c",
      "rust",
      "python",
      "go",
      "yaml",
      "regex",
      "r",
      "php",
      "matlab",
      "json",
      "html",
      "git_config",
      "git_rebase",
      "gitcommit",
      "gitignore",
      "dockerfile",
      "cpp",
      "cuda",
      "bash",
      "css",
      "sql",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
