-- plugin/nvim-dap
local dap = require 'dap'

-- 
-- ADAPTERS
--

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode',
  name = 'lldb'
}

-- 
-- CONFIGURATIONS
--

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

dap.configurations.c = dap.configurations.cpp

-- 
-- EXTERNAL PLUGINS
--

require 'nvim-dap-virtual-text'.setup {}
require 'dapui'.setup {}
