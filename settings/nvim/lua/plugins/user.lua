-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  "nvim-treesitter/nvim-treesitter",
  {
    "mxsdev/nvim-dap-vscode-js",
    config = function()
      require("dap-vscode-js").setup {
        -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
        debugger_path = "/Users/tony/.vscode-js-debug", -- Path to vscode-js-debug installation.
        -- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
        adapters = {
          "chrome",
          "pwa-node",
          "pwa-chrome",
          "pwa-msedge",
          "node-terminal",
          "pwa-extensionHost",
          "node",
          "chrome",
        }, -- which adapters to register in nvim-dap
        -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
        -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
        -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
      }

      for _, language in ipairs { "typescript", "javascript" } do
        require("dap").configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      local rt = require "rust-tools"
      local mason_registry = require "mason-registry"

      local codelldb = mason_registry.get_package "codelldb"
      local extension_path = codelldb:get_install_path() .. "/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

      rt.setup {
        dap = {
          adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
        },
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-n>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
        tools = {
          hover_actions = {
            auto_focus = true,
          },
        },
      }

      require("mason").setup {
        PATH = "append",
      }
    end,
  },
  "airblade/vim-gitgutter",
  -- 'codota/tabnine-nvim',
  "tzachar/cmp-tabnine",
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "mfussenegger/nvim-dap",
    {
      "akinsho/flutter-tools.nvim",
      config = function()
        require("flutter-tools").setup {
          debugger = {
            enabled = false, -- Enable debug mode
            run_via_dap = false, -- Enable debug mode
            register_configurations = function() -- Use a function, no trailing underscore
              -- Load DAP module directly
              require("dap").adapters.dart = {
                type = "executable",
                command = vim.fn.stdpath "data" .. "/mason/bin/dart-debug-adapter",
                args = { "flutter" },
              }

              require("dap").configurations.dart = {
                {
                  type = "dart",
                  request = "launch",
                  name = "Launch flutter",
                  dartSdkPath = "home/flutter/bin/cache/dart-sdk/",
                  flutterSdkPath = "home/flutter",
                  program = "${workspaceFolder}/lib/main.dart",
                  cwd = "${workspaceFolder}",
                },
              }
              -- No equivalent for loading a 'launch.json' file here
            end,
          },
        }
      end,
    },
    dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
    "dart-lang/dart-vim-plugin",
    "thosakwe/vim-flutter",
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts) require("gopher").setup(opts) end,
    build = function() vim.cmd [[silent! GoInstallDeps]] end,
  },
  "nanotee/sqls.nvim",
  {
    "windwp/nvim-ts-autotag",
    require("nvim-ts-autotag").setup(),
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = true,
    },
    config = function()
      local lspconfig = require "lspconfig"
      local util = require "lspconfig/util"

      lspconfig.gopls.setup {
        cmd = { "gopls", "serve" },
        filetypes = { "go", "gomod" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      }

      lspconfig.sqls.setup {
        cmd = { "/Users/tony/go/bin/sqls", "--config", "/Users/tony/.config/sqls/config.yaml" },
        on_attach = function(client, bufnr) require("sqls").on_attach(client, bufnr) end,
      }
      --   lspconfig.rust_analyzer.setup {
      --     on_attach = function(client, bufnr)
      --       -- Enable auto formatting on save
      --       if client.server_capabilities.documentFormattingProvider then
      --         vim.api.nvim_create_autocmd("BufWritePre", {
      --           group = vim.api.nvim_create_augroup("LspFormatting", {}),
      --           buffer = bufnr,
      --           callback = function() vim.lsp.buf.formatting_sync(nil, 1000) end,
      --         })
      --       end
      --     end,
      --   }
    end,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  -- {
  --   "tpope/vim-dadbod",
  --   cmd = { "DB", "DBUI", "DBPrompt" },
  --   config = function() end,
  -- },
  -- {
  --   "kristijanhusak/vim-dadbod-ui",
  --   cmd = { "DBUI", "DBUIToggle", "DBUIFindBuffer" },
  --   dependencies = { "tpope/vim-dadbod" },
  -- },
  -- {
  --   "kristijanhusak/vim-dadbod-completion",
  --   ft = { "sql", "mysql", "plsql" },
  --   dependencies = { "tpope/vim-dadbod" },
  -- },
  "rust-lang/rust.vim",
}
