local dap, dapui = require("dap"), require("dapui")

dapui.setup();
-- adapter configurations c

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/home/hoanglinh/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" }
}

local gdb_config = {
  {
    name = "GDB Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
}
local cpptool_configs = {
  {
    name = "Launch file cpptools",
    type = "cppdbg",
    request = "launch",
    program = function()
      local program_path = vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')

      if program_path == vim.fn.getcwd() .. "/" then
        local current_file = vim.fn.expand('%')
        local fileBasenameNoExtension = current_file:match("^(.+)%..+$")
        program_path = program_path .. fileBasenameNoExtension;
      end

      print("program_path = " .. program_path)
      return program_path;
    end,
    cwd = '${workspaceFolder}',
    -- stopAtEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}
dap.configurations.c = cpptool_configs
dap.configurations.cpp = cpptool_configs
dap.configurations.rust = cpptool_configs

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
