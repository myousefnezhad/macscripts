return {
  'nvim-treesitter/nvim-treesitter',
  'mxsdev/nvim-dap-vscode-js',
  'simrat39/rust-tools.nvim',
  'airblade/vim-gitgutter',
  'codota/tabnine-nvim',
  'tzachar/cmp-tabnine',
  {
    'saecki/crates.nvim',
    ft = { 'rust', 'toml' },
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    'mfussenegger/nvim-dap',
    'akinsho/flutter-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'stevearc/dressing.nvim' },
    'dart-lang/dart-vim-plugin',
    'thosakwe/vim-flutter',
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    require('nvim-ts-autotag').setup()
  },
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}
