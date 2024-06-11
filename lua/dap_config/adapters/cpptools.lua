local dap = require('dap')
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = 'C:/nvim_PATH/cpptools-win64/extension/debugAdapters/bin/OpenDebugAD7.exe',
    options = {
        detached = false
    }
}
