return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      "lua", "vimdoc", "javascript", "typescript", "c", "rust", "python", "go", "yaml", "regex", "r", "php", "matlab",
      "json", "html", "git_config", "git_rebase", "gitcommit", "gitignore", "dockerfile", "cpp", "cuda", "bash", "css"
    })
  end,
  require 'nvim-treesitter.configs'.setup {
    autotag = {
      enable = true,
    }
  },
}
