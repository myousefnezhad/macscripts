require("dapui").setup()


local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.even_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.keymap.set("n", "<Leader>dx", ':DapTerminate<CR>:lua require("dapui").toggle()<CR>')
vim.keymap.set("n", "<Leader>ds", ':DapStepOver<CR>')
vim.keymap.set("n", "<Leader>di", ':DapStepInto<CR>')
vim.keymap.set("n", "<Leader>do", ':DapStepOut<CR>')
vim.keymap.set("n", "<Leader>dr", ':DapContinue<CR>')
vim.keymap.set("n", "<Leader>dt", ':lua require("dapui").toggle()<CR>')
vim.keymap.set('n', '<F5>', ':DapContinue<CR>')
vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)
vim.keymap.set('n', '<leader>B', function()
  require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)

local js_based_languages = { "typescript", "javascript", "typescriptreact" }

--for _, language in ipairs(js_based_languages) do
--  require("dap").configurations[language] = {
--    {
--      type = "pwa-node",
--      request = "launch",
--      name = "Launch file",
--      program = "${file}",
--      cwd = "${workspaceFolder}",
--    },
--    {
--      type = "pwa-node",
--      request = "attach",
--      name = "Attach",
--      processId = require 'dap.utils'.pick_process,
--      cwd = "${workspaceFolder}",
--    },
--    {
--      type = "pwa-chrome",
--      request = "launch",
--      name = "Start Chrome with \"localhost\"",
--      url = "http://localhost:3000",
--      webRoot = "${workspaceFolder}",
--      userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
--    }
--  }
--end
