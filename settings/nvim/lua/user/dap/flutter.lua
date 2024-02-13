require('flutter-tools').setup {
  --   -- Windows-specific: Uncomment and modify the path
  --   -- flutter_path = "home/flutter/bin/flutter.bat",
  --
  debugger = {
    enabled = false,                       -- Enable debug mode
    run_via_dap = false,                   -- Enable debug mode
    register_configurations = function()   -- Use a function, no trailing underscore
      -- Load DAP module directly
      require('dap').adapters.dart = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
        args = { "flutter" }
      }

      require('dap').configurations.dart = {
        {
          type = "dart",
          request = "launch",
          name = "Launch flutter",
          dartSdkPath = 'home/flutter/bin/cache/dart-sdk/',
          flutterSdkPath = "home/flutter",
          program = "${workspaceFolder}/lib/main.dart",
          cwd = "${workspaceFolder}",
        }
      }
      -- No equivalent for loading a 'launch.json' file here
    end,
  },
  --
  --   dev_log = {
  --     enabled = false, -- Toggle when not using DAP
  --     open_cmd = "tabedit",
  --   },
  --
  -- lsp = {
  --   -- Note: these assume you have Neovim's built-in LSP client set up
  --   --       adjust according to your setup.
  --   on_attach = require('lspconfig').on_attach, -- Use with the 'lspconfig' plugin
  --   capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- }
}
