local dap = require('dap')
local dapUi = require('dapui')

require("nvim-dap-virtual-text").setup()
require("dapui").setup()

require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  debugger_path = '/Users/jamesjohnson/Projects/vscode-js-debug', -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
})

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/Projects/vscode-node-debug2/out/src/nodeDebug.js' },
}

dap.adapters.node = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/Projects/vscode-node-debug2/out/src/nodeDebug.js' },
}

dap.adapters.chrome = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/Projects/vscode-chrome-debug/out/src/chromeDebug.js" }
}

require('dap.ext.vscode').load_launchjs(
  nil,
  {
    node = {
      'vue',
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact'
    }
  }
)

function toggle_breakpoint_condition()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end

vim.keymap.set("n", "<space>db", dap.toggle_breakpoint, { noremap = true, silent = true })
vim.keymap.set("n", "<space>dC", toggle_breakpoint_condition, { noremap = true, silent = true })
vim.keymap.set("n", "<space>dc", dap.continue, { noremap = true, silent = true })
vim.keymap.set("n", "<space>do", dap.step_over, { noremap = true, silent = true })
vim.keymap.set("n", "<space>di", dap.step_into, { noremap = true, silent = true })
vim.keymap.set("n", "<space>dr", dap.run_to_cursor, { noremap = true, silent = true })
vim.keymap.set("n", "<space>dR", dap.repl.toggle, { noremap = true, silent = true })
vim.keymap.set("n", "<space>du", dapUi.toggle, { noremap = true, silent = true })
