local rt = require("rust-tools")
local mason_registry = require("mason-registry")
local codelldb = mason_registry.get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
rt.setup({
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
})

require("mason").setup({
  PATH = "append"
})

-- local dap = require "dap"
--dap.adapters.codelldb = {
--  type = "server",
--  port = "13000",
--  host = "127.0.0.1",
--  executable = {
--    command = "/Users/tony/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb", --port 13000 --liblldb /Users/tony/.local/share/nvim/mason/packages/codelldb/extension/lldb/lib/liblldb.dylib",           --codelldb_path .. " --port 13000 --liblldbi " .. liblldb_path,
--    args = { "--port", "13000", "--liblldb",
--      "/Users/tony/.local/share/nvim/mason/packages/codelldb/extension/lldb/lib/liblldb.dylib" },
--  }
--}
--
--dap.adapters.codelldb = {
--  type = 'executable',
--  command = "codelldb",
--  name = "lldb"
--}

--dap.configurations.rust = {
--  {
--    name = "Rust debug",
--    type = "codelldb",
--    request = "launch",
--    program = function()
--      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
--    end,
--    cwd = '${workspaceFolder}',
--    stopOnEntry = true,
--  },
--}
